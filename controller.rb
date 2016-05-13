require_relative 'model.rb'
require_relative 'view'

class MainController

  def initialize(argumentos)
    @list = List.new
    @view = View.new
    opcion_usuario(argumentos)
  end

  def opcion_usuario(argumentos)
    file = 'mi_agenda.csv'
    if argumentos[0] == "add"
      tarea = argumentos[1..-1].join(" ")
      add_tarea(tarea)
    elsif argumentos[0] == "index"
      index_lista
    elsif argumentos[0] == "delete"
      delete_lista(argumentos[1])
    elsif argumentos[0] == "complete"
      cambiar_status(argumentos[1])
    end      
  end
  
  def add_tarea(tarea)
    @list.add_task(Tarea.new(tarea))
  end

  def index_lista
    @view.ver_agenda(@list.read_list)
  end

  def delete_lista(num)
    @list.delete_lista(num)
  end

  def cambiar_status(num)
    @list.complete_task(num)
  end

end

MainController.new(ARGV)

  # end

  # def crear_agenda(file, tareas)
  #   tareas = tareas.split(",")
  #   @modelo.create_tareas(file, tareas)
  # end

  # def add_tareas(file, tareas)
  #   tareas = tareas.split(",")
  #   @modelo.add_tareas(file, tareas)
  # end

  # def ver_tareas(file)
  #   @view.ver_agenda(file)
  # end

  # def borrar_tarea(file, num)
  #   @modelo.delete_tarea(file, num)
  # end

  # def tarea_realizada(file, num)
  #   @modelo.edit_agenda(file, num)
  # end



#main.crear_agenda("mi_agenda.csv", "Lavar mi ropa,Leer,Estudiar JAVA,Pasear a mi perro,Estudiar Ruby,Comer con mis amigos")

#main.add_tareas("mi_agenda.csv", "Ir a la biblioteca")

#main.ver_tareas("mi_agenda.csv")
#main.borrar_tarea("mi_agenda.csv", 4)
#main.tarea_realizada("mi_agenda.csv", 2)
