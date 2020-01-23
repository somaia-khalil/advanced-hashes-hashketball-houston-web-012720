require 'pry'
def game_hash
    { 
    :home =>{
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
        :player_name =>"Alan Anderson",
        :number =>0,
        :shoe =>16,
        :points =>22,
        :rebounds =>12,
        :assists =>12,
        :steals =>3,
        :blocks =>1,
        :slam_dunks =>1
        },
        {:player_name =>"Reggie Evans",
        :number =>30,
        :shoe =>14,
        :points =>12,
        :rebounds =>12,
        :assists =>12,
        :steals =>12,
        :blocks =>12,
        :slam_dunks =>7
          
        },
        {:player_name =>"Brook Lopez",
        :number =>11,
        :shoe =>17,
        :points =>17,
        :rebounds =>19,
        :assists =>10,
        :steals =>3,
        :blocks =>1,
        :slam_dunks =>15
          
        },
        {:player_name =>"Mason Plumlee",
        :number =>1,
        :shoe =>19,
        :points =>26,
        :rebounds =>11,
        :assists =>6,
        :steals =>3,
        :blocks =>8,
        :slam_dunks =>5
          
        },
        {:player_name =>"Jason Terry",
        :number =>31,
        :shoe =>15,
        :points =>19,
        :rebounds =>2,
        :assists =>2,
        :steals =>4,
        :blocks =>11,
        :slam_dunks =>1
         }
        ]},
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{
        :player_name =>"Jeff Adrien",
        :number =>4,
        :shoe =>18,
        :points =>10,
        :rebounds =>1,
        :assists =>1,
        :steals =>2,
        :blocks =>7,
        :slam_dunks =>2
        },
        {:player_name =>"Bismack Biyombo",
        :number =>0,
        :shoe =>16,
        :points =>12,
        :rebounds =>4,
        :assists =>7,
        :steals =>22,
        :blocks =>15,
        :slam_dunks =>10
          
        },
        {:player_name =>"DeSagna Diop",
        :number =>2,
        :shoe =>14,
        :points =>24,
        :rebounds =>12,
        :assists =>12,
        :steals =>4,
        :blocks =>5,
        :slam_dunks =>5
          
        },
        {:player_name =>"Kemba Walker",
        :number =>33,
        :shoe =>15,
        :points =>6,
        :rebounds =>12,
        :assists =>12,
        :steals =>7,
        :blocks =>5,
        :slam_dunks =>12
          
        },
        {:player_name =>"Ben Gordon",
        :number =>8,
        :shoe =>15,
        :points =>33,
        :rebounds =>3,
        :assists =>2,
        :steals =>1,
        :blocks =>1,
        :slam_dunks =>0
        
        }]
    }
  }
end
#binding.pry

def num_points_scored (players_name)
  # game_hash.each do |location, team_data|
  #   team_data.each do |attribute, data|
  #     if attribute == :players 
  #       data.each do |player| #its an array thats why only #one block variable, and each player is a hash, #thats why we accsess it with an key
  #         if player[:player_name] == players_name 
  #           return player[:points]
  #         end
  #       end
  #     end
  #   end
  # end
  
  iterate_through_players_for(players_name, :points)
  
end

def shoe_size (players_name)
  # game_hash.each do |location, team_data|
  #   team_data.each do |attribute, data|
  #     if attribute == :players
  #       data.each do |player| # = to hash of each player
  #         if player[:player_name] == players_name
  #           return player[:shoe]
  #         end
  #       end
  #     end
  #   end
  # end
  iterate_through_players_for(players_name,:shoe)
  
end

def team_colors (team_name)
  game_hash.each do |location , team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers (team_name)
  newhash = []
  game_hash.each do |place , team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute,data|
        if attribute == :players
          data.each do |player|
             newhash << player[:number]
          end
        end
      end
    end
  end
  newhash
end

def player_stats(player_name)
  newhash={}
  game_hash.each do |location, team_data|
    team_data.each do |attribute,data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_name
             newhash = player.delete_if do |key,value|
                key == :player_name
            end
          end
        end
      end
    end
  end
  newhash
end

def big_shoe_rebounds
  biggest_sheo = 0
  biggest_round = 0
  game_hash.each do |location,team_data|
    team_data.each do |attribute,data|
      if attribute == :players
        data.each do |player|
          if player[:shoe] > biggest_sheo
           biggest_sheo= player[:shoe]
           biggest_round = player[:rebounds]
          #binding.pry
          end
        end
      end
    end
  end
  biggest_round
end


# This is a helper method that makes it less repetitive to iterate through
# the hash for every statistic. That way, I can have methods that return
# each stat given a player's name, but don't have to write the same loop
# over and over again.
def iterate_through_players_for(name, situation)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players 
        data.each do |player| 
          if player[:player_name] == name
            return player[situation]
          end
         end
      end
    end
  end
end

def most_points_scored
  largest_point = 0 
  player_name = nil 
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:points]> largest_point
        largest_point = player[:points]
        player_name = player[:player_name]
        end
      end
  end
  player_name
end

def winning_team 
  sum_of_points_home=0
  sum_of_points_away=0
  game_hash[:home][:players].each do |player|
    sum_of_points_home += player[:points]
    #binding.pry
  end
  game_hash[:away][:players].each do |player|
    sum_of_points_home += player[:points]
  end
  if sum_of_points_home>sum_of_points_away
    return game_hash[:home][:team_name]
    elsif sum_of_points_away>sum_of_points_home
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name()
  player_l = 0
  longest_player = nil
  game_hash.each do |location,team_data|
    team_data[:players].each do |player|
      if player[:player_name].length >= player_l
      player_l = player[:player_name].length
      longest_player = player[:player_name]
      #binding.pry
      end
    end
  end
  longest_player
end

def long_name_steals_a_ton?
  max_steal = 0
  playerwithmaxsteal = nil
   game_hash.each do |location,team_data|
    team_data[:players].each do |player|
      if player[:steals] > max_steal
        max_steal = player[:steals]
        playerwithmaxsteal = player[:player_name]
       if player_with_longest_name( ) == playerwithmaxsteal
         return true
       end
      end
    end
  end
end


# game_hash
#     { 
#     :home =>{
#       :team_name => "Brooklyn Nets",
#       :colors => ["Black", "White"],
#       :players => [{
#         :player_name =>"Alan Anderson",
#         :number =>0,
#         :shoe =>16,
#         :points =>22,
#         :rebounds =>12,
#         :assists =>12,
#         :steals =>3,
#         :blocks =>1,
#         :slam_dunks =>1
#         },
#         {:player_name =>"Reggie Evans",
#         :number =>30,
#         :shoe =>14,
#         :points =>12,
#         :rebounds =>12,
#         :assists =>12,
#         :steals =>12,
#         :blocks =>12,
#         :slam_dunks =>7
          
#         },
#         {:player_name =>"Brook Lopez",
#         :number =>11,
#         :shoe =>17,
#         :points =>17,
#         :rebounds =>19,
#         :assists =>10,
#         :steals =>3,
#         :blocks =>1,
#         :slam_dunks =>15
          
#         },
#         {:player_name =>"Mason Plumlee",
#         :number =>1,
#         :shoe =>19,
#         :points =>26,
#         :rebounds =>11,
#         :assists =>6,
#         :steals =>3,
#         :blocks =>8,
#         :slam_dunks =>5
          
#         },
#         {:player_name =>"Jason Terry",
#         :number =>31,
#         :shoe =>15,
#         :points =>19,
#         :rebounds =>2,
#         :assists =>2,
#         :steals =>4,
#         :blocks =>11,
#         :slam_dunks =>1
#         }
#         ]},
#     :away => {
#       :team_name => "Charlotte Hornets",
#       :colors => ["Turquoise", "Purple"],
#       :players => [{
#         :player_name =>"Jeff Adrien",
#         :number =>4,
#         :shoe =>18,
#         :points =>10,
#         :rebounds =>1,
#         :assists =>1,
#         :steals =>2,
#         :blocks =>7,
#         :slam_dunks =>2
#         },
#         {:player_name =>"Bismack Biyombo",
#         :number =>0,
#         :shoe =>16,
#         :points =>12,
#         :rebounds =>4,
#         :assists =>7,
#         :steals =>22,
#         :blocks =>15,
#         :slam_dunks =>10
          
#         },
#         {:player_name =>"DeSagna Diop",
#         :number =>2,
#         :shoe =>14,
#         :points =>24,
#         :rebounds =>12,
#         :assists =>12,
#         :steals =>4,
#         :blocks =>5,
#         :slam_dunks =>5
          
#         },
#         {:player_name =>"Kemba Walker",
#         :number =>33,
#         :shoe =>15,
#         :points =>6,
#         :rebounds =>12,
#         :assists =>12,
#         :steals =>7,
#         :blocks =>5,
#         :slam_dunks =>12
          
#         },
#         {:player_name =>"Ben Gordon",
#         :number =>8,
#         :shoe =>15,
#         :points =>33,
#         :rebounds =>3,
#         :assists =>2,
#         :steals =>1,
#         :blocks =>1,
#         :slam_dunks =>0
        
#         }]
#     }
#   }
# end