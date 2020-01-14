require 'sqlite3'
require 'singleton'


class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true 
        self.results_as_hash = true 
    end 
end 

class User
  attr_accessor :id, :fname, :lname
    
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

   def self.find_by_name(fname, lname)
    results = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
      SQL
    
    raise "Name does not exist" unless results
    User.new(results.first)
  end 
    
  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question::find_by_author_id(self.id)
  end

  def authored_replies
    Reply::find_by_user_id(self.id)
  end
 
end 

class Question 
  attr_accessor :id, :title, :body, :user_id
  
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

    def self.find_by_id(id)
        results = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            users
        WHERE
            id = ?
        SQL

        raise "ID does not exists" unless results
        Question.new(results.first)
    end 

    def self.find_by_author_id(author_id)
      results = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT
            *
        FROM
            questions
        WHERE
            user_id = ?
        SQL
            raise "This author has no questions" unless results
        results.map { |result| Questions.new(result)}
    end
        
    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end

    def author
        results = QuestionsDatabase.instance.execute(<<-SQL, self.id)
            SELECT
                users.*
            FROM
                users
            INNER JOIN
                questions ON users.id = questions.users_id
            WHERE
                users.id = ?
            SQL
            
        User.new(results)
    end

    def replies
        Reply::find_by_user_id(self.id)
    end 
end 

class QuestionFollows

end 

class Reply
    attr_accessor :id, :user_id, :body, :subject, :parent_id, :question_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map { |datum| Reply.new(datum) }
    end

    def self.find_by_user_id(id)
        results = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            replies
        WHERE
            user_id = ?
        SQL

        raise "ID does not exist" unless results
        results.map {|result| Reply.new(result)}
    end 

     def self.find_by_question_id(question_id)
      results = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            *
        FROM
            replies
        WHERE
            question_id = ?
        SQL
        raise "There is no question with this ID" unless results
        results.map { |result| Reply.new(result)}
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @body = options['body']
        @subject = options['subject_id']
        @parent_id = options['parent_id']
        @question_id = options['question_id']
    end

    def author
        results = QuestionsDatabase.instance.execute(<<-SQL, self.id)
            SELECT
                users.*
            FROM
                users
            INNER JOIN
                replies ON users.id = replies.users_id
            WHERE
                users.id = ?
            SQL
            
        User.new(results)
    end

    def question
        results = QuestionsDatabase.instance.execute(<<-SQL, self.question_id)
            SELECT
                questions.*
            FROM
                questions
            INNER JOIN
                replies ON questions.id = replies.users_id
            WHERE
                questions.id = ?
            SQL
    
        Question.new(results)
    end 

    def parent_reply
        results = QuestionsDatabase.instance.execute(<<-SQL, self.parent_id)
            SELECT 
                R2.*
            FROM
                replies AS R1
            INNER JOIN
                replies AS R2 ON R1.id = R2.parent_id
            WHERE
                R1.id = ?
        SQL
        Reply.new(results.first)   
    end 

    def child_replies
        results = QuestionsDatabase.instance.execute(<<-SQL, self.id)
            SELECT 
                R1.*
            FROM
                replies AS R1
            INNER JOIN
                replies AS R2 ON R1.id = R2.parent_id
            WHERE
                R2.id = ?
        SQL
        Reply.new(results.first)   
    end 
end 

class QuestionLikes

end 