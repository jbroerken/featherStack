//
//  DocumentPickerView.swift
//
//  Copyright (C) 2020 Jens Broerken
//  <jens.broerken@hs-augsburg.de>
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//

// Imports
import UIKit
import MobileCoreServices
import SwiftUI


// NOTE: This isn't really a view, but this was the best place
//       to put it.
class FSSetPickerView: UIDocumentPickerViewController {
    
    //************************************************************
    // Variables
    //************************************************************
    
    @Binding private var s_AddURL: URL
    
    //************************************************************
    // Init
    //************************************************************

    /**
     *  Initialize the document picker.
     *
     *  - Parameter b_Picked: The file picked flag.
     */
    
    init(_ s_AddURL: Binding<URL>) {
        self._s_AddURL = s_AddURL
        
        super.init(documentTypes: [kUTTypeZipArchive] as [String], in: .import)

        allowsMultipleSelection = false // Pick one only
        delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //************************************************************
    // Toggle
    //************************************************************
    
    /**
     *  Toggle the bound picked variable.
     *
     *  - Parameter s_URL: The file url of the source.
     */
    
    fileprivate func ImportSet(_ s_URL: URL) -> Void {
        s_AddURL = s_URL
    }
}

//************************************************************
// Extensions
//************************************************************

extension FSSetPickerView: UIDocumentPickerDelegate {
    
    //************************************************************
    // Document Picker Implementation
    //************************************************************
    
    /**
     *  React to a selected document.
     *
     *  - Parameter controller: The view controller which called.
     *  - Parameter didPickDocumentsAt: All file urls chosen by the user.
     */
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        ImportSet(urls.first!)
    }
    
    /**
     *  React to the user closing the picker.
     *
     *  - Parameter controller: The view controller which called.
     */

    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {}
}
