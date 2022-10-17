//
//  CameraList.swift
//  MarsRoverPhotos
//
//  Created by İbrahim Erdogan on 14.10.2022.
//

import Foundation


enum PerseveranceCameras : String , Identifiable , CaseIterable
{
    case none
    case EDL_RUCAM
    case EDL_RDCAM
    case EDL_DDCAM
    case EDL_PUCAM1
    case EDL_PUCAM2
    case NAVCAM_LEFT
    case NAVCAM_RIGHT
    case MCZ_RIGHT
    case MCZ_LEFT
    case FRONT_HAZCAM_LEFT_A
    case FRONT_HAZCAM_RIGHT_A
    case REAR_HAZCAM_LEFT
    case REAR_HAZCAM_RIGHT
    case SKYCAM
    case SHERLOC_WATSON
    var id : String{
        return rawValue
    }
    
    func name()-> String{
        switch self {
        case .none:
            return "All Cameras"
        case .EDL_RUCAM:
            return "Rover Up-Look Camera"
        case .EDL_RDCAM:
            return "Rover Down-Look Camera"
        case .EDL_DDCAM:
            return "Descent Stage Down-Look Camera"
        case .EDL_PUCAM1:
            return "Parachute Up-Look Camera A"
        case .EDL_PUCAM2:
            return "Parachute Up-Look Camera B"
        case .NAVCAM_LEFT:
            return "Navigation Camera - Left"
        case .NAVCAM_RIGHT:
            return "Navigation Camera - Right"
        case .MCZ_RIGHT:
            return "Mast Camera Zoom - Right"
        case .MCZ_LEFT:
            return "Mast Camera Zoom - Left"
        case .FRONT_HAZCAM_LEFT_A:
            return "Front Hazard Avoidance Camera - Left"
        case .FRONT_HAZCAM_RIGHT_A:
            return  "Front Hazard Avoidance Camera - Right"
        case .REAR_HAZCAM_LEFT:
            return "Rear Hazard Avoidance Camera - Left"
        case .REAR_HAZCAM_RIGHT:
            return "Rear Hazard Avoidance Camera - Right"
        case .SKYCAM:
            return "MEDA Skycam"
        case .SHERLOC_WATSON:
            return "SHERLOC WATSON Camera"
        }
    }

}

enum CuriosityCameras : String , Identifiable , CaseIterable
{
    case none
    case FHAZ
    case RHAZ
    case MAST
    case CHEMCAM
    case MAHLI
    case MARDI
    case NAVCAM
    var id : String {
        return rawValue
    }
    
    
    func name()-> String{
        switch self {
        case .none:
            return "All Cameras"
        case .FHAZ:
            return "Front Hazard Avoidance Camera"
        case .RHAZ:
            return "Rear Hazard Avoidance Camera"
        case .MAST:
            return "Mast Camera"
        case .CHEMCAM:
            return "Chemistry and Camera Complex"
        case .MAHLI:
            return "Mars Hand Lens Imager"
        case .MARDI:
            return "Mars Descent Imager"
        case .NAVCAM:
            return "Navigation Camera"

        }
    }
}

enum OpportunityAndSpiritCameras : String , Identifiable , CaseIterable
{
    case none
    case FHAZ
    case RHAZ
    case NAVCAM   
    case PANCAM
    case MINITES
     var id : String {
         return rawValue
 }
    func name()-> String{
        switch self {
        case .none:
            return "All Cameras"
        case .FHAZ:
            return "Front Hazard Avoidance Camera"
        case .RHAZ:
            return "Rear Hazard Avoidance Camera"
        case .PANCAM:
            return "Panoramic Camera"
        case .MINITES:
            return "Miniature Thermal Emission Spectrometer (Mini-TES)"
        case .NAVCAM:
            return "Navigation Camera"

        }
    }
}

