//
//  CustomAlignmentGuide.swift
//  LayoutAndGeometry
//
//  Created by Henrieke Baunack on 4/28/24.
//

import SwiftUI

// this guide helps aligning views along a sinlge line BUT you stil have to tell it HOW to align
// e.g now we can tell our views for example to use their center to align on the MidAccountAndName guide, i.e. their center will be on the same lien
extension VerticalAlignment {
//    struct MidAccountAndName: AlignmentID {
    // we don't need to create instances of it
    enum MidAccountAndName: AlignmentID {
        // if there is no .alignmentGuide on a View, this alignment will be used
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    // making a constant that wraps the alignment object for easier access
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct CustomAlignmentGuide: View {
    var body: some View {
        // what if we now want the full name (Henrieke Baunack) to be alinged with "Henny2.0"? We need a custom alignemnt guide
        // the .top alignment on the HStack will use the edge of the VStacks for alignment
        Spacer()
        HStack(alignment:.top){
            VStack{
                Text("Henny2.0")
                Image("exampleImage")
                    .resizable()
                    .frame(width: 50, height:50)
            }
            VStack(alignment:.leading){
                Text("Full name")
                Text("Henrieke Baunack")
            }
        }
        Spacer()
        
        //solution with a custom alignment guide
        // these will be an extension of vertical OR horizontal alignment (depending on what you are trying to do)
        
        HStack(alignment:.midAccountAndName){
            VStack{
                Text("Henny2.0")
                // for midAccountName guide
                // send me back the center positioning and align that on the guide
                    .alignmentGuide(.midAccountAndName){ dimension in
                        dimension[VerticalAlignment.center] // returning
                    }
                Image("exampleImage")
                    .resizable()
                    .frame(width: 50, height:50)
                Text("Test")

            }
            VStack(alignment:.leading){
                Text("Test")
                Text("Full name")
                Text("Henrieke Baunack")
                    .alignmentGuide(.midAccountAndName){ dimension in
                        dimension[VerticalAlignment.center] // returning
                    }
            }
        }
        Spacer()
    }
}

#Preview {
    CustomAlignmentGuide()
}
