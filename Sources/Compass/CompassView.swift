import Foundation
import CoreLocation
import SwiftUI

public struct CompassView: View {
  let heading: CLHeading // 0 -> 360

  public init(heading: CLHeading) {
    self.heading = heading
  }

  var offset: CGFloat {
    if heading.trueHeading < 1 || heading.trueHeading > 359 {
      return withAnimation(nil) {
        180
      }
    } else {
      return withAnimation(.linear) {
        heading.trueHeading - 180
      }
    }
  }

  public var body: some View {
    VStack {
       HStack(spacing: 0) {
        AxisLine()
           .zIndex(3)
        AxisLine()
           .zIndex(2)
        AxisLine()
           .zIndex(1)
      }

      .offset(x: offset, y: 0)
      .mask(Rectangle()
              .frame(width: 240, height: 30))

      Image(systemName: "arrowtriangle.up.fill")
        .resizable()
        .foregroundColor(.primary)
        .frame(width: 16, height: 16)
        .opacity(0.8)
    }
    .frame(maxWidth: .infinity)
  }

  struct AxisLine: View {
    var body: some View {
      ZStack {
        Rectangle()
          .fill(.blue.opacity(0.5))
          .frame(width: 360, height: 5)
          .zIndex(-1)
        DirectionMark(text: "S")
          .zIndex(10)
        DirectionMark(text: "N").offset(x: 180, y: 0)
          .zIndex(10)
        DirectionMark(text: "E").offset(x: 90, y: 0)
          .zIndex(10)
        DirectionMark(text: "W").offset(x: -90, y: 0)
          .zIndex(10)
      }
    }

    struct DirectionMark: View {
      var text: String
      var size: CGFloat = 34
      let fontName = "Didot-Bold"
      var body: some View {
        RoundedRectangle(cornerRadius: 5, style: .circular)
          .fill(.clear)
          .overlay(
            Text(text)
              .font(.custom(fontName, fixedSize: size))
              .multilineTextAlignment(.center)
              .foregroundColor(.primary.opacity(0.8))
              .fixedSize()
            )
          .frame(width: size, height: size)
          .opacity(0.9)
      }
    }
  }
}
