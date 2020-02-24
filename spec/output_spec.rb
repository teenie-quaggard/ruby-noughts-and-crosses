require 'output'
require 'board'

RSpec.describe Output do
    describe "#hello" do
        it 'prints intro to game' do
            output = Output.new   
            expect do
                output.hello
              end.to output("Howdy stranger. Welcome to Noughts and Crosses.\n").to_stdout
        end
    end

    describe "#board" do
        it "prints the current board" do
            board = Board.new()
            output = Output.new(:board => board)
            expect do 
                output.board
            end.to output(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n").to_stdout
        end
    end

end