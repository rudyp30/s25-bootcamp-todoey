//
//  ContentView.swift
//  s25-bootcamp-todoey
//
//  Created by Rudy Patel on 2/24/25.
//

import SwiftUI

struct Todo: Identifiable {
    var id = UUID()
    var item: String
    var isDone: Bool = false
}

struct ContentView: View {
    @State private var todos: [Todo] = [
        Todo(item: "Finish SwiftUI project", isDone: true)
    ]
    
    @State private var newTodo: String = ""

    var body: some View {
        VStack(){
            List {
                ForEach($todos) { $todo in
                    HStack()
                    {
                        Toggle("Write a Task!", isOn: $todo.isDone)
                            .labelsHidden()
                        
                        TextField("task", text: $todo.item)
                            .textFieldStyle(PlainTextFieldStyle())
                            .foregroundColor(todo.isDone ? .gray : .black)
                    }
                    .padding(5)
                    
                }
                .onDelete(perform: deleteTodo)
                
                HStack() //for new todo
                {
                    TextField("New todo", text: $newTodo, onCommit: addTodo)
                }
            }
        }
        .padding()
    }
        
    func addTodo() {
        todos.append(Todo(item: newTodo, isDone: false))
        newTodo = ""
    }

    func deleteTodo(at offsets: IndexSet) //copied from given website
    {
        todos.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
