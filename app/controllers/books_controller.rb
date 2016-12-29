class BooksController < ApplicationController
  def list
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @subjects = Subject.all
  end

  def create
    #when create method is called, it pass down new Book instance, consisting of book_params (described below), and save it in @book
    @book = Book.new(params: book_params)

    #when book is saved (save is triggered when submit button is pressed)
    if @book.save
      #if save is successful, redirect to 'list' action
      redirect_to :action => 'list'
    else
      #if save is unsuccessful, store @subjects and redirect to 'new' action
      @subjects = Subject.all
      redirect_to :action => 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
    @subjects = Subject.all
  end

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(book_params)
      redirect_to :action => 'show', :id => @book
    else
      @subjects = Subject.all
      redirect_to :action => 'edit'
    end
  end

  def delete
    Book.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def show_subjects
    @subject = Subject.find(params[:id])
  end
  private

  def book_params
    params.require(:book).permit(:title, :price, :subject_id)
  end
end
