require '~/ruby/user'
require '~/ruby/table'
require '~/ruby/turn'
require '~/ruby/deck'
require 'yaml.rb'

class UI
  def run
    user1 = User.new("Jonas","123","J@K.l");
    user2 = User.new("Kazys","456","K@K.l");
    user3 = User.new("Petras","789","P@K.l");
    user4 = User.new("Bronius","147","B@K.l");
    table = Table.new(5,2);
    user1.joinTable(table,200);
    user2.joinTable(table,200);
    user3.joinTable(table,200);
    user4.joinTable(table,200);
    turn = table.startTurn();
    while true
      puts "Turn:    #{turn.move.username}"
      puts "Balance: #{turn.move.tableBalance}"
      puts "Hand:    #{turn.move.hand.inspect}"
      puts "Pot:     #{turn.pot}"
      puts "Choose your destiny: "
      puts "1.Fold"
      puts "2.Call"
      puts "3.Raise"
      puts "4.Save"
      puts "5.Load"
      choice = gets.chomp
      if (choice == "1")
        turn.fold(turn.move)
      elsif (choice == "2")
        turn.call(turn.move)
      elsif (choice == "3")
        puts "How many?:"
        choice = gets.chomp
        turn.raise(turn.move, choice.to_i)
      elsif (choice == "4")
        output = File.new('table.yml', 'w')
        output.puts YAML.dump(table)
        output = File.new('turn.yml', 'w')
        output.puts YAML.dump(turn)
        output.close
      elsif (choice == "5")
        output = File.new('table.yml', 'r')
        table = YAML.load(output.read)
        output = File.new('turn.yml', 'r')
        turn = YAML.load(output.read)
        output.close
      end   
    end
  end
end
    
    

if __FILE__ == $0
  x = UI.new()
  x.run
end

