# Bills Tracking App.

- Users can sign up and login to their own accounts. DONE
- Log bills, amounts and date (or have categories) DONE
- List bills DONE
- Store them somewhere DONE
- Have a few graphs (this year / last year)



## Features/Possible Features:
- Sort options
- Add bills
- View list of bills
- Graphing
- Monthly/Quarterly breakdown
- Comparisons with previous months/years
- Forecasting
- Splitting with housemates (Other users)
- Add bill categories


=========================================================================

## Planning:

- Site-map
- Wire-frames


## Problems:
- Login - if name is spelled incorrectly page throws noMethod error
- Paid input - Currently not in use. Default value sent to params is on / nil. 
- Update bill - Unable to send query string via action??
- Adding fractional values to amount - SQL column value needs to be changed


## Lessons:
- Incremental development - Fail fast!
- Primary Serial Key - Best option for when you need to delete from db.
- Decide on naming conventions during planning.
- Using redirects to send query strings.
- Page throws error - Have you read the error correctly? No, but seriously, have you read the error correctly? No, but seriously, have you read the error correctly? No but seriously... If you're going round in circles, you havn't read the error correctly. 
- CSS "Templating" - Useful to apply css styling to elements accross a number of pages. This helps to maintain a coherent style across all pages and prevents having to go back and forth to check styling specs. 
- Learning to work quickly - Shortcuts are amazing for efficient work-flow.