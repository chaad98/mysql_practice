class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

    def index
        @books = Book.all
        #saya dah mandi
    end

    def show
        @book = Book.find(params[:id])
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to root_path, notice: 'Book created successfully!'
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @book.update(book_params)
            redirect_to root_path, notice: 'Book updated successfully!'
        else
            render :edit
        end
    end

    def destroy
        @book.destroy
        redirect_to root_path, notice: 'Book deleted successfully!'
    end

    private

    def book_params
        params.require(:book).permit(:author, :title)
    end

    def set_book
        @book = Book.find(params[:id])
    end
end
