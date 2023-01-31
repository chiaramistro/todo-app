//
//  TodoList.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 24/01/23.
//

import SwiftUI

//enum MixedEmotions: String, CaseIterable {
//    case Smile, Crying, Laughing
//}

struct TodoList: View {
    // state = special piece of data = redrew what to show to user
    //    @State var selection: MixedEmotions = .Crying
    //    var images: [String] = ["0e5", "3h7rsv"]
    
    @State private var showCompletedOnly = false
    @EnvironmentObject var modelData: ModelData
    @State private var showAddNewTodo = false
    @State private var showFiltersModal = false
    
    var filteredTodos: [Todo] {
        modelData.todos.filter { todo in
            (!showCompletedOnly || todo.completed)
        }
    }
    
    
    var body: some View {
        // create navigation
        NavigationView {
            
            // vertically stack items
            VStack(alignment: .center) {
                
                
                //                Text(selection.rawValue)
                //                    .font(.system(size: 100))
                //                Text("Have fun with this amazing app!")
                //                    .font(.subheadline)
                //
                //                Picker("Select emotion", selection: $selection) {
                //                the only thing unique about the string is the string itself: each string in our array is different, so the strings are naturally unique.
                //                    ForEach(MixedEmotions.allCases, id: \.self) { emoji in
                //                        Text(emoji.rawValue)
                //                    }
                //                }.pickerStyle(.segmented)
                
                
                //                use \.self as key path to the identifier
                //Lists work with identifiable data. You can make your data identifiable in one of two ways: by passing along with your data a key path to a property that uniquely identifies each element, or by making your data type conform to the Identifiable protocol.
                
                //                ForEach(images, id: \.self) { image in
                //                    CircleImage(image: image)
                //                }
                
                //                List(todos) { todo in //if model is identifiable, no need to specify id
                //                    NavigationLink {
                //                        TodoDetailsView(todo: todo)
                //                    } label: {
                //                        TodoItem(todo: todo)
                //                    }
                //                }
                
                //                To combine static and dynamic views in a list, or to combine two or more different groups of dynamic views, use the ForEach type instead of passing your collection of data to List.
                //
                
                HStack(spacing: 50) {
                    Button {
                        showFiltersModal.toggle()
                    } label: {
                        Text("Filter").font(.headline).foregroundColor(Color.theme.primary)
                    }
                    Spacer() // take all available space for spacer
                    NavigationLink {
                        StatisticsGraphView()
                    } label: {
                        Text("Show statistics").font(.headline).foregroundColor(Color.theme.primary)
                    }
                }.padding([.leading, .trailing, .top], 20)
                
                List {
                    ForEach(filteredTodos) { todo in
                        NavigationLink {
                            TodoDetailsView(todo: todo)
                        } label: {
                            TodoItem(todo: todo)
                        }
                    }
                    .listRowInsets(EdgeInsets()) // remove list paddings
                    .listRowBackground(Color.theme.secondary)
                    .padding(10)
                    
                    Button(action: {
                        showAddNewTodo.toggle()
                    }) {
                        HStack {
                            Label("Add new todo", systemImage: "plus.circle.fill").labelStyle(.iconOnly).foregroundColor(Color.theme.white)
                            Text("Add new todo").bold().foregroundColor(Color.theme.white)
                        }
                    }.foregroundColor(Color.theme.white)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.theme.secondary)
                        .padding(10)
                    
                }.background(Color.theme.darkGreen) // set background color to list
                    .scrollContentBackground(.hidden) // hide grey background from list
                
                //                NavigationLink(destination: TodoDetailsView(), isActive: $isShowingDetailView) {
                //                    EmptyView() // showing nothing for now
                //                }
                //
                //                Button("Go to todo details") {
                //                    self.isShowingDetailView = true;
                //                }
                
            }.padding() // example of modifier
            // modifier = methods returning the view + the extra modifications
            // navigation options are attached to the first item inside the navigationview (not the navview itself)
                .navigationBarTitle("List", displayMode: .inline)
                .sheet(isPresented: $showAddNewTodo) {
                    NavigationView {
                        AddTodoView(showAddNewTodoModal: $showAddNewTodo)
                    }
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                showAddNewTodo = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                showAddNewTodo = false
                            }
                        }
                    }
                    
                }
                .sheet(isPresented: $showFiltersModal) {
                    FiltersModal(showCompletedOnly: $showCompletedOnly, showFiltersModal: $showFiltersModal)
                    //                    define height of filter modal
                        .presentationDetents([.height(200)])
                }
                .background(Color.theme.darkGreen)
            
        }
        //        .environmentObject(todo) // shared between all views of the NavigationView stack
    }
}

struct FiltersModal: View {
    @Binding var showCompletedOnly: Bool
    @Binding var showFiltersModal: Bool
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .trailing) {
                Button {
                    self.showFiltersModal.toggle()
                } label: {
                    Text("Dismiss").font(.headline).foregroundColor(Color.theme.primary)
                }.padding()
                Form {
                    Toggle(isOn: $showCompletedOnly) {
                        Text("Completed only").bold()
                    }.tint(Color.theme.primary)
                }.scrollContentBackground(.hidden)
            }.background(Color.theme.secondary)
        }
        
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList().environmentObject(ModelData())
    }
}
