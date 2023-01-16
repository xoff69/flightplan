class BoardsController < ApplicationController
  before_action :set_board, only: %i[ show edit update destroy ]
  before_action :set_week, only: %i[ show edit   ]


  # GET /boards or /boards.json
  def index
    logger.info current_user.email
    @boards = Board.where("user_id = ?", current_user.id)
  end

  # GET /boards/1 or /boards/1.json
  def show
    
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards or /boards.json
  def create
    @board = Board.new(board_params)
    @board.user_id=current_user.id
    respond_to do |format|
      if @board.save
        format.html { redirect_to board_url(@board), notice: "Board was successfully created." }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1 or /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to board_url(@board), notice: "Board was successfully updated." }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1 or /boards/1.json
  def destroy
    @board.destroy

    respond_to do |format|
      format.html { redirect_to boards_url, notice: "Board was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def appel_aja
    logger.debug "appel_aja"
    donnee=" chanson connue "
    respond_to do |format|
        format.html { render json: donnee }
        # format.js { render json: donnee }
        # format.json { render json: donnee }
      end
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    def data_day(day)
      l0=Ticket.where(board_id: @board.id, planified_for: ((Date.today+day.days) - 1.days)..Date.today+day.days)
      s=Set.new
      l0.each { |x| s<< x }
      Tuple.new(day,s, Date.today+day)
    end

    def set_week
      @board = Board.find(params[:id])
    
      p0=data_day(0)
      p1=data_day(1)
      p2=data_day(2)
      p3=data_day(3)
      p4=data_day(4)
      p5=data_day(5)
      p6=data_day(6)
      
      @semaine=[p0,p1,p2,p3,p4,p5,p6]
      
    end

    # Only allow a list of trusted parameters through.
    def board_params
      params.require(:board).permit(:name)
    end
end
