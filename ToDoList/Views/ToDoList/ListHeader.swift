//
//  ListHeader.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 08.08.2022.
//

import SwiftUI

struct ListHeader: View {
    @State private var showSearchForm = false
    @Binding var searchQuery: String
    
    var body: some View {
        HStack {
            Text("ToDo")
            Spacer()
            if !showSearchForm {
                if searchQuery.isEmpty {
                    Button {
                        showSearchForm.toggle()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("Haiti"))
                    }
                } else {
                    HStack {
                        Text(searchQuery)
                            .font(.custom("WorkSans-Medium", size: 24))
                            .foregroundColor(Color("Grey"))
                        Button {
                            searchQuery = ""
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(Color("Red"))
                                .rotationEffect(.degrees(45))
                        }
                    }
                    .padding(.horizontal)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("LightGrey"))
                    }
                }
            } else {
                HStack {
                    TextField("Search", text: $searchQuery)
                        .frame(width: 150, alignment: .trailing)
                        .padding(.horizontal)
                        .onSubmit {
                            showSearchForm.toggle()
                    }
                    Button {
                        searchQuery = ""
                        showSearchForm.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color("Red"))
                            .rotationEffect(.degrees(45))
                    }
                }
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("LightGrey"))
                }
            }
        }
        .font(.custom("WorkSans-Bold", size: 24))
        .padding(16)
    }
}

struct ListHeader_Previews: PreviewProvider {
    static var previews: some View {
        ListHeader(searchQuery: .constant("qwerty"))
    }
}
