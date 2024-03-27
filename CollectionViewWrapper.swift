//
//  CollectionViewWrapper.swift
//  Memento
//
//  Created by Zhang on 2024/2/25.
//

import SwiftUI

struct CollectionViewWrapper: UIViewControllerRepresentable {
    @EnvironmentObject var dataModel: DataModel
    
    func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
    
    func makeUIViewController(context: Context) -> PuzzleCollectionViewController {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 500, height: 500)
        let controller = PuzzleCollectionViewController(collectionViewLayout:layout)
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: PuzzleCollectionViewController, context: Context) {
        // TODO: coordinates? Update the view controller if needed
        uiViewController.collectionView.reloadData()

    }
    
    class Coordinator: NSObject {
            var parent: CollectionViewWrapper
            
            init(_ parent: CollectionViewWrapper) {
                self.parent = parent
            }
            
            // Define actions such as shuffling here if needed
        }
}

#Preview {
    CollectionViewWrapper()
        .frame(width: 500, height: 500)
        .background(.black)
}
