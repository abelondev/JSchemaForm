//
//  ResourceFormViewController.swift
//  Example
//
//  Created by Andrey Belonogov on 11/19/15.
//  Copyright © 2015 Andrey Belonogov. All rights reserved.
//

import Foundation
import Eureka

public class ResourceFormViewController: JSchemaFormViewController {

    public init(scopeName: String)  {
        super.init(nibName: nil, bundle: nil);

        let scopeDict:[String: AnyObject] = try! JsonHelper.readDictionary(scopeName)!;
        if let vscope = try? JScope(scopeDictionary: scopeDict) {
            scope = vscope;
        }
    }
 
    public init(schemaName: String, formName: String?, modelName: String?)  {
        super.init(nibName: nil, bundle: nil);
        
        var _schemaDict:[String: AnyObject];
        var _formArray:[AnyObject]?;
        var _modelDict:[String: AnyObject]?;
        
        _schemaDict = try! JsonHelper.readDictionary(schemaName)!;
        if let formName = formName {
            _formArray = JsonHelper.readArray(formName)!
        }
        if let modelName = modelName {
            _modelDict = try! JsonHelper.readDictionary(modelName)!
        }
        scope = JScope(schemaDictionary: _schemaDict, formArray: _formArray, modelDictionary: _modelDict)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String:AnyObject]
                return json
            } catch {
                print("Something went wrong")
            }
        }
        return nil
    }
    
      
    func readFile(bundleFileName:String) -> String?
    {
        let path = NSBundle.mainBundle().pathForResource("bundleFileName", ofType: "json")
        do {
            let text = try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
            return text
        } catch let error as NSError {
            print("error \(error) loading from url \(path)")
            return nil
        }
        
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
      
        let submitButton = UIBarButtonItem(barButtonSystemItem: .Done, target:self, action: "submitAction")
        self.navigationItem.rightBarButtonItems = [submitButton];
    }
    
    func multipleSelectorDone(item:UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func submitAction() {
        let lvalues = result()?.values
        print("\(lvalues)")
    }
    
}
