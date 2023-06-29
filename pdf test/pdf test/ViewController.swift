//
//  ViewController.swift
//  pdf test
//
//  Created by Shashikant Suryakant Bhadke on 28/06/23.
//

import UIKit
import PDFKit

final class ViewController: UIViewController {
    var pdfViewValue = PDFView()
    let pdfDocument = PDFDocument()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let image = getPDFErrorView(),
        let page = PDFPage(image: image) else { return }
        
        pdfDocument.insert(page, at: 0)
        pdfViewValue.document = pdfDocument
        pdfViewValue.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfViewValue)
        NSLayoutConstraint.activate([
            pdfViewValue.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pdfViewValue.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pdfViewValue.topAnchor.constraint(equalTo: view.topAnchor),
            pdfViewValue.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    private func getPDFErrorView() -> UIImage? {
        let errorView = UIView()
        errorView.bounds = view.bounds
        errorView.backgroundColor = .white
        let errorTitleLabel = UILabel()
        errorTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        errorTitleLabel.text = "Test"
        errorTitleLabel.textAlignment = .center
        errorView.addSubview(errorTitleLabel)
        let errorSubTitleLabel = UILabel()
        errorSubTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        errorSubTitleLabel.attributedText = NSAttributedString(string: "Test test")
        errorSubTitleLabel.textAlignment = .center
        errorView.addSubview(errorSubTitleLabel)
        addErrorTitleConstraints(errorView: errorView, errorTitleLabel: errorTitleLabel)
        addErrorSubTitleConstraints(errorView: errorView, errorTitleLabel: errorTitleLabel,
                                    errorSubTitleLabel: errorSubTitleLabel)
        let format = UIGraphicsImageRendererFormat()
        format.opaque = true
        format.scale = 1
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size, format: format)
        let image = renderer.image { _ in
            errorView.drawHierarchy(in: errorView.bounds, afterScreenUpdates: true)
        }
        return image
    }
}
private extension ViewController {
    func addErrorTitleConstraints(errorView: UIView,
                                  errorTitleLabel: UILabel) {
        let horizontalConstraint = NSLayoutConstraint(item: errorTitleLabel,
                                                      attribute: NSLayoutConstraint.Attribute.centerX,
                                                      relatedBy: NSLayoutConstraint.Relation.equal,
                                                      toItem: errorView,
                                                      attribute: NSLayoutConstraint.Attribute.centerX,
                                                      multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: errorTitleLabel,
                                                    attribute: NSLayoutConstraint.Attribute.centerY,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: errorView,
                                                    attribute: NSLayoutConstraint.Attribute.centerY,
                                                    multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: errorTitleLabel,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                 multiplier: 1, constant: 300)
        let heightConstraint = NSLayoutConstraint(item: errorTitleLabel,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                  multiplier: 1, constant: 23)
        errorView.addConstraints([horizontalConstraint, verticalConstraint,
                                  widthConstraint, heightConstraint])
    }
    func addErrorSubTitleConstraints(errorView: UIView,
                                     errorTitleLabel: UILabel,
                                     errorSubTitleLabel: UILabel) {
        let horizontalConstraint = NSLayoutConstraint(item: errorSubTitleLabel,
                                                      attribute: NSLayoutConstraint.Attribute.centerX,
                                                      relatedBy: NSLayoutConstraint.Relation.equal,
                                                      toItem: errorView,
                                                      attribute: NSLayoutConstraint.Attribute.centerX,
                                                      multiplier: 1, constant: 0)
        let widthSubConstraint = NSLayoutConstraint(item: errorSubTitleLabel,
                                                    attribute: NSLayoutConstraint.Attribute.width,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                    multiplier: 1, constant: 270)
        let heightSubConstraint = NSLayoutConstraint(item: errorSubTitleLabel,
                                                     attribute: NSLayoutConstraint.Attribute.height,
                                                     relatedBy: NSLayoutConstraint.Relation.equal,
                                                     toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                     multiplier: 1, constant: 23)
        let topConstraint = NSLayoutConstraint(item: errorSubTitleLabel, attribute: .top,
                                               relatedBy: .equal, toItem: errorTitleLabel,
                                               attribute: .bottom, multiplier: 1, constant: 8)
        errorView.addConstraints([horizontalConstraint, widthSubConstraint, heightSubConstraint, topConstraint])
    }
}

