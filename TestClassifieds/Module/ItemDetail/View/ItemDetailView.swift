//
//  ItemDetailView.swift
//  TestClassifieds
//
//  Created by Ahmad Mustafa on 28/05/2022.
//

import SwiftUI

struct ItemDetailView: View {
    let result: Result
    var body: some View {
        VStack {
            headerView
            
            imagesScrollView
            
            buyButton
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(result: Result(creationTime: "2019-02-24 02:34", price: "AED 12", name: "sunglass", uid: "", imageIds: [], imageUrls: [], imageUrlsThumbnails: ["https://demo-app-photos-45687895456123.s3.amazonaws.com/f12fbe72ae0d4ce281f53265f2d36e71-thumbnail?AWSAccessKeyId=ASIASV3YI6A4Z57LTJZX&Signature=V%2FNny%2B48ySQY%2BtEMhH%2BokCf%2Fq1M%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEOv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQDnYBPlwznO0umocAoX1z0WxrlbTHLkZsAt7CTv7fNc1wIhAMNq9zGDkeNxJpLtSo68gN5F9LXi0Gqi%2Bw5ib77BUgBJKp0CCNT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQAxoMMTg0Mzk4OTY2ODQxIgz4ciut7%2BfdjXbLjJ8q8QFiKtyXHbIoDxJ8aduZcrHeb618beVSeDtINZf9JAFvmUktv%2Fyl8uy7cWZuaQOCu7mVgvGmI9YUW6ckHp%2FHmyc6QXdTYPGeywk3EKpmaqk1DkgNCOeY3Rzt8m%2BvhUVzOMqlZ5Lrc1d6uG4lGHy0eJ8ySsIG5%2FuxBAeAL0kJWj8iGIvHtfhWANZkOymR69At9GQUuG%2B%2FAq53pxKjFI5xGLgdM9WXQCtzb%2F3DQbG%2BCwbGKASVVSWtu1BqWhiC9hE%2Fnp1DCZN%2FGE9uiJvBjGhtZe8trcciaHEJ%2BMNcTI3KFb1Ip1Dk5h5M4yqxcR6qqR36IgagMOL5x5QGOpkB%2BC%2BGPTcWLzjEToQ0WEstGnqqfHYFdqzi5RfmMAveLppcrilSo57m4aLlnfyH0mQqKJxkKaqsLp4pZOp%2FGGIf8zanUPEEWWWLoQgwg4%2FoZuU%2B%2FL6oOOrte12Hjo%2FgZudRF2dX0WgdEBQFwntXA1DOlmSEBe2hiQLi51zKiVxEs%2FLORd3wv1fZs9%2BrH%2FW7Sysw8O8tv8ItRK2y&Expires=1653738284"]))
    }
}

//MARK: - Some Views
extension ItemDetailView{
    var headerView: some View{
        HStack {
            VStack(alignment: .leading){
                Text(result.name.capitalizingFirstLetter())
                    .font(.title2)
                    .padding([.top, .horizontal])
                Text(result.creationTime)
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
            }
            Spacer()
        }
    }
    
    var imagesScrollView: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 20){
                ForEach(result.imageUrlsThumbnails, id: \.self) { urlString in
                    AsyncImage(url: URL(string: urlString)){ image in
                        image.resizable()
                            .scaledToFit()
                            .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: 0)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: Constants.Size.imageSize)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                }
            }
        }
        .frame(width: Constants.Size.imageSize)
    }
    
    var buyButton: some View{
        Button{
            print("Buying item")
        } label: {
            Text("Buy for \(result.price)")
                .foregroundColor(.white)
                .padding()
        }
        .background(.blue.opacity(0.4))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: 0)
    }
}
