import UIKit
import Eureka
import CoreLocation

class HomeViewController : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageRow.defaultCellUpdate = { cell, row in
           cell.accessoryView?.layer.cornerRadius = 17
           cell.accessoryView?.frame = CGRectMake(0, 0, 34, 34)
        }
        
        let section =
            Section("Forms examples");
        
        let confs:[AnyObject] = [["Types.schema"],["Simple.schema","Simple.form"],["Basic.schema"],["KitchenSink.schema"],"Task.scope"];
        
        for conf in confs {
            if let array = conf as? [String]  {
                let schemaName = array[0];
                var formName:String;
                if (conf.count>1) {
                    formName = array[1]
                }
                else {
                    formName = ""
                }
                var modelName:String? = nil;
                if (conf.count>2) {
                    modelName = array[2]
                }

                section <<< ButtonRow("\(schemaName) \(formName)") {
                            $0.title = $0.tag
                            $0.presentationMode = .Show(controllerProvider: ControllerProvider.Callback
                                {
                                    return ResourceFormViewController(schemaName:schemaName, formName: formName, modelName: modelName)
                                },
                                completionCallback: { vc in vc.navigationController?.popViewControllerAnimated(true) })
                                
                        }
            }
            else if let scopeName = conf as? String {
                section <<< ButtonRow("\(scopeName)") {
                    $0.title = $0.tag
                    $0.presentationMode = .Show(controllerProvider: ControllerProvider.Callback
                        {
                            return ResourceFormViewController(scopeName:scopeName)
                        },
                        completionCallback: { vc in vc.navigationController?.popViewControllerAnimated(true) })
                    
                }
            }
        }
        
        form +++= section
        
        }
}


