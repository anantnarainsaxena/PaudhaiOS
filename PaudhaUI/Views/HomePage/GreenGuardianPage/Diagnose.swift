//
//  Diagnose.swift
//  PaudhaUI
//
//  Created by Anant Narain on 16/01/24.
//

//
//  Diagnose.swift
//  Paudha
//
//  Created by user 1 an on 18/12/23.
//

import SwiftUI

struct Diagnose: View {
    var body: some View {
        
            VStack{
                
                
                VStack{
                    
                    CardContentDiagnose()
                    
                }
                
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.9686, green: 0.8824, blue: 0.8431), Color(red: 240/255.0, green: 255/255.0, blue: 241/255.0)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
        
    }
}

struct Diagnose_Previews: PreviewProvider {
    static var previews: some View {
        Diagnose()
    }
}
