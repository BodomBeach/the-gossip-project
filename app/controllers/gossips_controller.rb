class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    puts params
    puts params
    puts params
    gossip = Gossip.create(gossip_params)
    redirect_to gossip_path id: gossip.id
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comments = Comment.where(gossip_id: params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    gossip = Gossip.create(gossip_params)
    redirect_to gossip_path id: gossip.id
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  def comment
    @gossip = Gossip.find(params[:id])
  end

  def create_comment
    @comment = Comment.create(content: params[:content], anonymous_commentor: params[:anonymous_commentor], gossip_id: params[:id])
    redirect_to gossip_path id: params[:id]
  end

  def delete_comment
    puts params
    puts params
    puts params
    puts params
    puts params
    puts params

    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path id: params[:gossip_id]
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content, :anonymous_gossiper)
  end

  def comment_params
    params.permit(:comment)
    params[:comment]
  end

end
