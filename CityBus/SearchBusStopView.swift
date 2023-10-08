//
//  BuscarParadaView.swift
//  CityBus
//
//  Created by Adrian Iraizos Mendoza on 8/10/23.
//

import SwiftUI

struct SearchBusStopView: View {
    @State var searchText = ""
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("No. parada", text: $searchText)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        //limitar a 4 dígitos
               
                    Button {
                        //llamar a a la api
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    
                Button {
                    // abrir cámara, leer código
                } label: {
                    
                    Image(systemName: "qrcode")
                }
                .buttonStyle(.bordered)
                }.padding()
                
                //Vista paradas
                
                HStack {
                    ForEach(1..<5) { stop in
                        Button {
                            
                        } label: {
                            Text("82")
                        }
                        .buttonStyle(.bordered)
                    }
                   
                }
                
            }
            .navigationTitle("Buscar parada")
        }
    }
}

#Preview {
    SearchBusStopView()
}
