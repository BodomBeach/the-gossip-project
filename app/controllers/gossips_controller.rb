class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end

  def create
    gossip = Gossip.create(gossip_params)
    redirect_to gossip_path id: gossip.id
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

end
