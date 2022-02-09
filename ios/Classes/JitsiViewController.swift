import UIKit
import JitsiMeetSDK

class JitsiVC: UIViewController {
    fileprivate var jitsiMeetView: JitsiMeetView?
    fileprivate var pipViewCoordinator: PiPViewCoordinator?

    var eventSink:FlutterEventSink? = nil
    
    @IBOutlet weak var videoButton: UIButton?
    @IBOutlet weak var roomName: UITextField!
    
    fileprivate var pipViewCoordinator: PiPViewCoordinator?
    fileprivate var jitsiMeetView: JitsiMeetView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillTransition(to size: CGSize,
                                    with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        let rect = CGRect(origin: CGPoint.zero, size: size)
        pipViewCoordinator?.resetBounds(bounds: rect)
    }

 
 @IBAction func openJitsiMeet(sender: Any?) {
        let room: String = roomName.text!
        if(room.count < 1) {
            return
        }
        
        // create and configure jitsimeet view
        let jitsiMeetView = JitsiMeetView()
        jitsiMeetView.delegate = self
        self.jitsiMeetView = jitsiMeetView
        let options = JitsiMeetConferenceOptions.fromBuilder { (builder) in
            // for JaaS use <tenant>/<roomName> format
            builder.room = room
            builder.welcomePageEnabled = true
            // Settings for audio and video
            // builder.audioMuted = true;
            // builder.videoMuted = true;
        }
        self.jitsiMeetView?.join(options)
        
        pipViewCoordinator = PiPViewCoordinator(withView: jitsiMeetView)
        pipViewCoordinator?.configureAsStickyView(withParentView: view)
        
        // animate in
        jitsiMeetView.alpha = 0
        pipViewCoordinator?.show()
        
        //
        //        // setup view controller
        //        let vc = UIViewController()
        //        vc.modalPresentationStyle = .fullScreen
        //        vc.view = jitsiMeetView
        //
        //        // join room and display jitsi-call
        //        jitsiMeetView.join(options)
        //        present(vc, animated: true, completion: nil)
    }
    
    fileprivate func cleanUp() {
        jitsiMeetView?.removeFromSuperview()
        jitsiMeetView = nil
        pipViewCoordinator = nil
    }
}


extension ViewController: JitsiMeetViewDelegate {

    // func enterPicture(inPicture data: [AnyHashable : Any]!) {
    //     DispatchQueue.main.async {
    //         self.pipViewCoordinator?.enterPictureInPicture()
    //     }
    // }
    

    func conferenceWillJoin(_ data: [AnyHashable : Any]!) {
            //        print("CONFERENCE WILL JOIN")
            var mutatedData = data
            mutatedData?.updateValue("onConferenceWillJoin", forKey: "event")
            self.eventSink?(mutatedData)
        }
        
        func conferenceJoined(_ data: [AnyHashable : Any]!) {
            //        print("CONFERENCE JOINED")
            var mutatedData = data
            mutatedData?.updateValue("onConferenceJoined", forKey: "event")
            self.eventSink?(mutatedData)
        }
        
        func conferenceTerminated(_ data: [AnyHashable : Any]!) {
            //        print("CONFERENCE TERMINATED")
            var mutatedData = data
            mutatedData?.updateValue("onConferenceTerminated", forKey: "event")
            self.eventSink?(mutatedData)
            
            DispatchQueue.main.async {
                self.pipViewCoordinator?.hide() { _ in
                    self.cleanUp()
                    self.dismiss(animated: true, completion: nil)
                }
            }
            
        }

        func enterPictureInPicture(_ data: [AnyHashable : Any]!) {
            //        print("CONFERENCE PIP IN")
            var mutatedData = data
            mutatedData?.updateValue("onEnterPictureInPicture", forKey: "event")
            self.eventSink?(mutatedData)
            DispatchQueue.main.async {
                self.pipViewCoordinator?.enterPictureInPicture()
            }
        }

        func participantJoined(_ data: [AnyHashable : Any]!) {
            //        print("CONFERENCE PIP IN")
            var mutatedData = data
            mutatedData?.updateValue("onParticipantJoined", forKey: "event")
            self.eventSink?(mutatedData)
            DispatchQueue.main.async {
                self.pipViewCoordinator?.participantJoined()
            }
        }

        func participantLeft(_ data: [AnyHashable : Any]!) {
            //        print("CONFERENCE PIP IN")
            var mutatedData = data
            mutatedData?.updateValue("onParticipantLeft", forKey: "event")
            self.eventSink?(mutatedData)
            DispatchQueue.main.async {
                self.pipViewCoordinator?.onParticipantLeft()
            }
        }

         func audioMutedChanged(_ data: [AnyHashable : Any]!) {
            //        print("CONFERENCE PIP IN")
            var mutatedData = data
            mutatedData?.updateValue("onAudioMutedChanged", forKey: "event")
            self.eventSink?(mutatedData)
            DispatchQueue.main.async {
                self.pipViewCoordinator?.audioMutedChanged()
            }
        }

         func endpointTextMessageReceived(_ data: [AnyHashable : Any]!) {
            //        print("CONFERENCE PIP IN")
            var mutatedData = data
            mutatedData?.updateValue("onEndpointTextMessageReceived", forKey: "event")
            self.eventSink?(mutatedData)
            DispatchQueue.main.async {
                self.pipViewCoordinator?.endpointTextMessageReceived()
            }
        }

        func exitPictureInPicture() {
            //        print("CONFERENCE PIP OUT")
            var mutatedData : [AnyHashable : Any]
            mutatedData = ["event":"onExitPictureInPicture"]
            self.eventSink?(mutatedData)

             DispatchQueue.main.async {
                self.pipViewCoordinator?.exitPictureInPicture()
            }
        }
}