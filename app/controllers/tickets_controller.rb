class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1 or /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    logger.debug  params[:board_id]
    @board=Board.find(params[:board_id])
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
    @board=Board.find(params[:board_id])
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    logger.info "iciiiiiiiiiii"
    logger.debug @ticket 
    x= params[:ticket][:fboard_id]
    logger.debug x.to_i
    @board=Board.find(x.to_i)
    logger.debug @board
    @ticket.board_id=x.to_i
    respond_to do |format|
      if @ticket.save
        #format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully created." }
        # format.json { render :show, status: :created, location: @ticket }
        format.html { redirect_to  @board, notice: "Ticket was successfully created." }
        
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:label, :description, :color, :archived, :datearchived, :duedate)
    end
end
