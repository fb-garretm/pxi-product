# Swoop Progressive Web App (PWA)

| Field | Value |
|-------|-------|
| Source | https://fastbreak.atlassian.net/wiki/spaces/ASPAD/pages/848461833 |
| Format | confluence |
| Imported | 2025-03-03 |

---

## Comparison Matrix

| **Option** | **Pros** | **Cons** | **Best For:** |
|---|---|---|---|
| **PWA NextJs App + WebView Wrapper ****(e.g. Capacitor, PWABuilder)** | Speed - Ideally one main repo that developers maintain, with occasional Expo updates. Most UI components can be used for both web and mobile experienceVery few pushes to the App Store - instant deployments via usual Vercel processEasier integration of Compete and Clubs into Swoop (same tech stack)Overall lower upfront effort to develop | Limitations on UI/design - Mobile App will function exactly like web app (no mobile gestures, mobile NavBars, etc)Potential denied app store submissions - Apple doesn't like WebView appsHave yet to see a proven production level application that relies solely on a PWAAbility to utilize Native APIs is questionable (for Camera, Geolocation, Notifications, etc.) Must use tools like CapacitorUnsure how WebView performs long term as an app grows in sizeService Workers (especially on IOS) will still sometimes struggle withReal-time Push NotificationsLong Running background tasksBackground syncing | A web-first application that just needs a presence in the app store |
| **Native Mobile Application (Expo)** | Reliable access to native APIs we need (camera, geolocation, notifications)No risk of failed app store submissions due to App StoreLong term scalabilityBetter performance (no WebView memory overhead)Reliable offline and background behavior | Higher upfront effort to build and maintainDifficult to maintain for two developers, and will take more time to build featuresMay not work well with existing FB-toolkit functionalityMay need to build separate UI for web and mobile apps (or use a tool like [React Native Reusables](https://reactnativereusables.com/))Must push to the app store frequently to release new features/updatesCompete/Club features must either be built or inserted into this experience via WebView/Iframe | A mobile first application that intends to scale upwards mobile development over time |

**Ian's Concerns and Findings: **
PWA falls short when it comes to:

- Reliability for all of the native API's. The solutions I have found for the permissions we need like geolocation and notifications are all work arounds or are silo'd to specific services for notifications. No flexibility and questionable reliability at scale. 
- Apple is very strongly opinionated against PWAs so we are gonna have issues with finding a middle ground on the grey area of what "app specific functionality&rdquo; we are including.
- com.apple.WebKit.WebContent is the process that runs the WebView to generate the content from the websites. iOS sets a 250MB - 1 GB kill switch on web views because it is not a native iOS function (the limit depends on the phone but it's approximately 10% of available RAM). This could be very hard to maintain with just in app messaging and all of the swoop features, let alone more troubling with additional product features.
