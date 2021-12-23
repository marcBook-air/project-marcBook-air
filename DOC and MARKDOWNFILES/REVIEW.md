# Review
My review partner is Max Westerman. He gave me the following point:

# Points of improvement from Max to me 
## Point 1:
On top of every file you can place a summary about the what the code does and in
which view the code is used. So I do this: 

    import SwiftUI

     struct SwiftUIView: View {
        var body: some View {
            VStack {
                Text("Hello, World!")
                    .padding()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.red)
                Text("Hi, World")
                    .padding()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.red)
            }
        }
    }

    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            SwiftUIView()
        }
    }

While I also could have done this:

    /*View is used in filename.swift and puts two blocks of red text in a vertical stack*/
    import SwiftUI

     struct SwiftUIView: View {
        var body: some View {
            VStack {
                Text("Hello, World!")
                    .padding()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.red)
                Text("Hi, World")
                    .padding()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.red)
            }
        }
    }

    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            SwiftUIView()
        }
    }

I didn't do this because I thought the functionnames, filenames, variablenames and the grouping of my files made this already very clear. But I have to admit that he has a valid point and I will do this different in the future.

## Point 2:
I use very often the same modifiers for different elements in my body. For example I very often do this:
  
    import SwiftUI

    struct SwiftUIView: View {
      var body: some View {
          VStack {
              Text("Hello, World!")
                  .padding()
                  .frame(width: 100, height: 100)
                  .foregroundColor(Color.red)
              Text("Hi, World")
                  .padding()
                  .frame(width: 100, height: 100)
                  .foregroundColor(Color.red)
          }
      }
    }

    struct SwiftUIView_Previews: PreviewProvider {
      static var previews: some View {
          SwiftUIView()
      }
    }

    While I also could have done this:

        import SwiftUI

        struct TextModyfiers: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .padding()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.red)
            }
        }

        struct SwiftUIView: View {
            var body: some View {
                VStack {
                    Text("Hello, World!").modifier(TextModyfiers())
                    Text("Hi, World").modifier(TextModyfiers())
                }
            }
        }

        struct SwiftUIView_Previews: PreviewProvider {
            static var previews: some View {
                SwiftUIView()
            }
        }
## Point 3:
I forgot to put a link to my screencast in my README so that is fixed now 

I didn't get any further points of improvement.
   

 




