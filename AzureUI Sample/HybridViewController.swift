//
//  HybridViewController.swift
//  AzureUI Sample
//
//  Created by Andrea Mannucci on 11/11/22.
//  Copyright © 2022 Mediolanum. All rights reserved.
//

import UIKit
import AzureCommunicationCommon
import AzureCommunicationUICalling


class HybridViewThemeOptions: ThemeOptions {
    var primaryColor: UIColor {
        return UIColor(red: 25.0 / 255.0, green: 45.0 / 255.0, blue: 110.0 / 255.0, alpha: 1.0)
    }
}

class HybridViewController: UIViewController {
    
    override func viewDidLoad() {
        startCallComposite()
    }

    private func startCallComposite() {
        let themeOptions = HybridViewThemeOptions()
        let localizationOptions = LocalizationOptions(locale: Locale(identifier: "en_US"))
        let callCompositeOptions = CallCompositeOptions(theme: themeOptions, localization: localizationOptions)
        let callComposite = CallComposite(withOptions: callCompositeOptions)

        let communicationTokenCredential = try! CommunicationTokenCredential(token: "eyJhbGciOiJSUzI1NiIsImtpZCI6IjEwNiIsIng1dCI6Im9QMWFxQnlfR3hZU3pSaXhuQ25zdE5PU2p2cyIsInR5cCI6IkpXVCJ9.eyJza3lwZWlkIjoiYWNzOjllYmQ4Yzg4LWFlZjctNGQ4ZC04MWYxLWEzOTAzMDVhMzFmOF8wMDAwMDAxNS0xYWM5LWE2ZWEtYWQ4YS1hZjNhMGQwMDk4Y2IiLCJzY3AiOjE3OTIsImNzaSI6IjE2Njg1MDkzMzYiLCJleHAiOjE2Njg1OTU3MzYsImFjc1Njb3BlIjoidm9pcCIsInJlc291cmNlSWQiOiI5ZWJkOGM4OC1hZWY3LTRkOGQtODFmMS1hMzkwMzA1YTMxZjgiLCJyZXNvdXJjZUxvY2F0aW9uIjoiZXVyb3BlIiwiaWF0IjoxNjY4NTA5MzM2fQ.bl44ng7rfzr1IDqZD0lpNq-gQiRcoCUSJtYH4vvm1N0co2H71JG9QA9vfsZmZneJlRba6F1n9ILyhhXbhiDgZmTxi96scMRRmkG3xB6QdeHnUEJAvG7dS-t05OfbX8nEIASj0Nz2OgN8ygVqB0zmUNu2JH-spbUwcXlS1UAoVpC4GjVIBKqWvAcJ_3n5NUcUnyB1ecRclk73XEMeaE7A_L0rIHE3U-pnGnYmj0M27KStOZbXwiOKZeBAVdDBbC2Drf_QAWrTf2yhuYhyfAoAhxoiRHelzu_Fs6p55JMAiRHjODVkfN1yVNHEudh9_uRiMrSF8Gu0hsMxpUYrfgImLg")

        let remoteOptions = RemoteOptions(for: .teamsMeeting(teamsLink: "https://teams.microsoft.com/l/meetup-join/19:meeting_ZTgwZmIzMzAtNTE2NS00YzNkLTgxNjYtMDQyYzJkNmEwZTRm@thread.v2/0?context=%7B%22Tid%22:%22b00367e2-193a-4f48-94de-7245d45c0947%22,%22Oid%22:%226703412a-c383-428a-91f7-5ca95844034e%22%7D"),
                                          credential: communicationTokenCredential,
                                          displayName: "<DISPLAY_NAME>")
        callComposite.launch(remoteOptions: remoteOptions)
    }
}
