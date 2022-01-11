## Application for exchanging currencies.

### Time limit 5h

The user has a multi-currency account with starting balance of **1000 Euros (EUR)**. He can convert any currency to any if the rate is provided by the API but the balance can't fall below zero. Create **an input** where the user will enter amount, **picker** for currency being **sold** and a **picker** for currency being **bought**. 

For example, user inputs **100.00**, picks **Euros** to sell and **Dollars** to buy. User then clicks **Submit** button, a message is shown `You have converted 100.00 EUR to 110.30 USD` and now the balance is **900.00 Euros** and **110.30 US Dollars**. 


## Currency Exchange Rate API

- The API is public and no authentication is required

**URI**: `http://api.exchangeratesapi.io/v1/latest

**Response example**:

```
{
  "rates": {
    "JPY": 118.52,
    "USD": 1.103,
    "GBP": 0.90155
  },
  "base": "EUR",
  "date": "2019-10-10"
}
```

## Requirements
- the task must be done in **Swift** and **SwiftUI**
- third-party libraries, tools, frameworks can be used
- the system should be maintainable & expandable

## Summary

This projected reflects work done during the time limit of 5 hours.
