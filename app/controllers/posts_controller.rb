class PostsController < ApplicationController
	attr_accessor :title, :description, :photos

	before_action :find_post, only: [:show, :delete, :edit, :update]
	# before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]
	#respond_to :html, :js
	#https://launchschool.com/blog/the-detailed-guide-on-how-ajax-works-with-ruby-on-rails

	def index
	    @posts = Post.all
	    @posts = Post.paginate(:page => params[:page], :per_page => 9).order('id DESC')
	end
	
	def new
		@post = Post.new
	end

	def create
		if @post.save
			redirect_to root_path
		else
			redirect_to root_path, notice: "Sorry. post not saved."
		end	
	end

	def update
	   	  @post.update(post_params)
          redirect_to root_path
	end

	def edit
			flash[:danger] = 'NOT YOURS!'
			redirect_to root_path
	end	

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to "/users/#{@post.user_id}"
	end

	def show
		@post = Post.find(params[:id])
		
	end

	private 
	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
	    params.require(:post).permit(:title, :description, :date, :time, :time_ago, :remove_photos, {:photos => []})
	end

	def check_admin
		unless @post.user_id == current_user.id
			flash[:danger] = 'NO HACKING!'
			redirect_to root_path
		end
	end
end
