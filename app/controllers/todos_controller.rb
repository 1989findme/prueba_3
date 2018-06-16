class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
  if @todo.save
    redirect_to todos_path, notice: "Se guardo con exito"
  else
      redirect_to todos_path, alert: "Error, falta descripción"
  end
end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end

 def complete
     @todo = Todo.find(params[:id])
     @todo.update(completed: true)
     redirect_to todos_list_path
 end

 def list
   @todos = Todo.all
 end

  private
  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
