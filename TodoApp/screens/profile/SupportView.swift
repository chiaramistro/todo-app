//
//  SupportView.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 23/01/23.
//

import SwiftUI

struct SupportView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Developer").font(.title).foregroundColor(Color.theme.white)
                Text("Chiara Mistrorigo").foregroundColor(Color.theme.white)
                
                Divider().overlay(Color.theme.white)
                
                MapView().padding()
                
                Spacer()
                
                NavigationLink(destination: PremiumFeaturesView()) {
                    Text("Get access to the premium features!").font(.subheadline).bold().foregroundColor(Color.theme.primary).padding([.bottom], 20)
                }

            }
            .background(Color.theme.darkGreen)
            
        }.navigationBarTitle("Support", displayMode: .inline)
        
    }
}

struct PremiumFeaturesView: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationStack {
            Form {
                HStack(alignment: .center) {
                    Text("Balance:").font(.body)
                    
                    if editMode?.wrappedValue.isEditing == true {
                        TextField("Balance amount", value: $modelData.profile.balance, format: .currency(code: Locale.current.currencyCode ?? "USD")).font(.body).bold().keyboardType(.decimalPad)
                    } else {
                        Text(modelData.profile.balance, format: .currency(code: Locale.current.currencyCode ?? "USD")).font(.body).bold()
                    }
                }
            }.toolbar { // Assumes embedding this view in a NavigationView.
                EditButton()
            }
        }
    }
}


struct SupportView_Previews: PreviewProvider {
    static var previews: some View {
        SupportView().environmentObject(ModelData())
    }
}
