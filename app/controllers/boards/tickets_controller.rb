class Boards::TicketsController < ApplicationController

    def show
      @ticket = Ticket.find(params[:id])
    end

    def new
      @status_options = Ticket.statuses.map{|u| [ u[0] ] }
      @ticket = Ticket.new
    end

    def create
      @ticket = Ticket.new(ticket_params)
      if @ticket.save
        flash[:success] = "Successfully created #{@ticket.title}"
        redirect_to boards_ticket_path(@ticket)
      else
        flash[:error] = "Ticket creation failed. Sad days"
        render :new
      end
    end

    def edit
      find_ticket
    end

    def destroy
      find_ticket
      flash[:notice] = "The ticket has been deleted"
      redirect_to root_path
    end

    def update
      find_ticket
      if @ticket.update(ticket_params)
        flash[:success] = "Successfully updated #{@ticket.title}"
        redirect_to boards_ticket_path(@ticket)
      else
        flash[:error] = "ticket update failed. Sad days"
        render :edit
      end
    end

    private

    def find_ticket
      @ticket = ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:title, :description, :status)
    end

end
