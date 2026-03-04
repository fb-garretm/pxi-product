# Standup Notes - Jan 26-30

| Field | Value |
|-------|-------|
| Source | https://fastbreak.atlassian.net/wiki/spaces/ASPAD/pages/952795137 |
| Format | confluence |
| Imported | 2025-03-03 |

---

**Sprint Work** 

-  Working through API, ran into a bug with the new RLS policies and pulling images from buckets. Working with Gavin to resolve
-  Working through Universal login on the mobile side, will work with Ben and Kwajo through potential RLS issues he's seeing 
-  Initial CometChat Mobile PoC nearly done, getting RLS policies finalized
-  working through messaging designs, parent linking

**Sprint Work** 

-  Fixed a big bug we were working through yesterday, ended up being an issue with fb-toolkit. Hoping to finish by EOD
-  Working towards finishing RLS policies, has been integrating with Ben's changes. Also hoping to finish by EOD.
-  Continuing to work through implementing test automation 
-  Working through feedback on event listing site, as well as messaging designs
-  main goal is finalizing RLS policies ASAP, Working with Ben B and Gavin. CometChat PoC still in flight
- We're tracking a potential issue where a customer says they did not get their images (SMA-264)
- Josh Portal Feedback

- 
Make sure we have clear CTAs in the app on both contractor and admin side, so users know can navigate with minimal confusion
- Currently, he has to have to click on an album to know if their are pending photos that need approval. Without clicking on it, the count (i.e. 400 photos) doesn't specify the status of those photos. We should display a logo or some CTA to show that photos are pending.
- Eventually need to give "power users&rdquo; access to submit photos that Admins don't need to approve

This is a much further down the line change, most likely once we implement Role Based Access Control as an organization.
- Adding a link in the email that navigates users to their purchased photos in the Swoop App

**Sprint Work** 

- No more Swoop Media, effective immediately
-  Will be starting on Universal Login with the portal today, syncing changes with Ben's new API
-  All Supabase calls in the app are done, continuously addressing RLS issues. Also nearing completion in the API, testing.
-  Getting swoop-web API wrapped up now that contractor RLS changes are not needed. Going to apply a fix for the queue worker bug. 
-  added a banner for bundled events on the swoop app, having conversations with compete and club as she works through designs for the next release

**Sprint Work** 

-  Swoop-API Changes are complete. Was able to integrate Swoop-web cleanly. Also will work with Ian to handle org changes. App is completely disconnected from Supabase now. 
-  Will being adding users to the public.users table when a new user logs in on the mobile app. Need to update universal login to check for SAML users instead of is_internal_user as it currently does.
-  Make sure migration scripts in swoop-web are up to date. Reviewing PRS this afternoon. 
-  Done with event listing design updates. Now cleaning up the messaging designs.
