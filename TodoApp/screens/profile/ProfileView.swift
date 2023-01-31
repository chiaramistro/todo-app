//
//  ProfileView.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 24/01/23.
//

import SwiftUI

struct ProfileView: View {
    //    Environment view property that keys off of the environment’s \.editMode.
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                if editMode?.wrappedValue == .inactive {
                    ProfileSummary(profile: modelData.profile)

                    Spacer()

                    NavigationLink {
                        SupportView()
                    } label: {
                        Text("Discover the developer").foregroundColor(Color.theme.primary).padding([.bottom], 20)
                    }
                } else {
                    ProfileEditor(profile: $draftProfile)
//                    show correct value on "done" button
                        .onAppear {
                            draftProfile = modelData.profile
                        }
                        .onDisappear {
                            modelData.profile = draftProfile
                        }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.theme.darkGreen)
            .navigationBarTitle("Profile", displayMode: .inline)
            .navigationBarItems(trailing:
                                    HStack {
                if editMode?.wrappedValue == .active {
                    //                    doesn’t apply the edits to the real profile data in its closure.
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                EditButton()
            }
                                
            )
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(ModelData())
    }
}
