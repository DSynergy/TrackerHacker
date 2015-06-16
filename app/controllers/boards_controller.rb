class BoardsController < ApplicationController

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:success] = "Successfully created #{@board.title}"
      redirect_to board_path(@board)
    else
      flash[:error] = "Board creation failed. Sad days"
      render :new
    end
  end

  def edit
    find_board
  end

  def destroy
    find_board
    flash[:notice] = "The board has been deleted"
    redirect_to root_path
  end

  def update
    find_board
    if @board.update(board_params)
      flash[:success] = "Successfully updated #{@board.title}"
      redirect_to board_path(@board)
    else
      flash[:error] = "Board update failed. Sad days"
      render :edit
    end
  end

  private

  def find_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title)
  end

end
