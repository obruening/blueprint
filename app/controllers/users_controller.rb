class UsersController < ApplicationController
  

  # GET /users
  # GET /users.xml
  def index
    (request.format == 'text/html') ? per_page = 10 : per_page = 3
    @users = User.paginate :all, :page => params[:page], :order => 'name asc', :per_page => per_page

    respond_to do |format|
      format.html { render :layout => 'html_application' } 
      format.xml  { render :xml => @users }
      format.bp 
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html { render :layout => 'html_application' }
      format.xml  { render :xml => @user }
      format.bp 
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html { render :layout => 'html_application' }
      format.xml  { render :xml => @user }
      format.bp 
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.html { render :layout => 'html_application' }
      format.xml  { render :xml => @user }
      format.bp 
    end
  end

  # POST /users
  # POST /users.xml
  def create
    if params[:user]
      @user = User.new(params[:user])
    else
      @user = User.new(:name => params[:name], :age => params[:age])
    end

    respond_to do |format|

      if @user.save
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
        format.bp   { redirect_to(@user) }
      else
        format.html { render :action => "new", :layout => 'html_application' }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        format.bp   { render :action => "new" }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    puts params.inspect
    if !params[:user]
      params[:user] = {:name => params[:name], :age => params[:age]}
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
        format.bp   { redirect_to(@user) }
      else
        format.html { render :action => "edit", :layout => 'html_application' }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        format.bp   { render :action => "edit" }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User deleted."

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
      format.bp   { redirect_to(users_url) }
    end
  end


  def destroy_blueprint
    @user = User.find(params[:id])
    #@user.destroy
    #flash[:notice] = "Record deleted."
    respond_to do |format|
      format.bp #{ redirect_to(users_url) }
    end

  end
end
