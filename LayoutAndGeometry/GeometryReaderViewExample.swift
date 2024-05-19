//
//  GeometryReaderViewExample.swift
//  LayoutAndGeometry
//
//  Created by Henrieke Baunack on 5/19/24.
//

import SwiftUI

// illustrating the issue with .containerRelativeFrame
// it does not consider containers like VStack/HStack, so we use Geomrety Reader
struct GeometryReaderViewExample: View {
    var body: some View {
        VStack{
            HStack{
                Text("TOP").frame(width: 300)
                Image("exampleImage")
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal){ size, axis in
                        size * 0.8
                    }
                Text("Bottom").frame(width: 200)
            }
            .background(.red)
            
            HStack{
                Text("TOP").frame(width: 100)
                GeometryReader { proxy in
                    Image("exampleImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: proxy.size.width * 0.8)
                    // Geometry Reader usually puts it in the left top corner, the following line will fix that
                        .frame(width: proxy.size.width, height: proxy.size.height)
                }
                Text("Bottom").frame(width: 100)
            }
            .background(.blue)
        }
    }
}

#Preview {
    GeometryReaderViewExample()
}
