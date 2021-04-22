#  Tranzzo Tokenizer (Evo fork)

![CocoaPods Compatible](https://img.shields.io/cocoapods/v/TranzzoTokenizer.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/TranzzoTokenizer.svg?style=flat)](https://github.com/tranzzo/ios-card-tokenizer/blob/dev/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/TranzzoTokenizer.svg?style=flat)](https://github.com/tranzzo/ios-card-tokenizer#)

## Requirements

- iOS 8+
- Swift 5+

## Installation

### CocoaPods

To integrate TranzzoTokenizer into your Xcode project using [CocoaPods](https://cocoapods.org), add it to your `Podfile`:

```ruby
pod 'EvoPayTokenizer'
```

Then, run the following command:

```bash
$ pod install
```

## Features

**Tokenization**: Simple way to obtain a Tranzzo user card token, generated on our servers.
    For more information visit our [**documentation**](https://cdn.tranzzo.com/tranzzo-api/index.html)
**Validation**: Use straightforward card utilities to validate, define and format your card input

## Usage

### Tokenization

1. Import TranzzoTokenizer framework header

    ```swift
    import EvoPayTokenizer
    ```

2. Initialize the tokenizer for an environment you are working with
    
    ```swift
    let tokenizer = TranzzoTokenizer(apiKey: apiKey, environment: environment)
    ```
    Make sure to replace `appKey` with your application key. 
    If you are already using [Tranzzo Widget](https://cdn.tranzzo.com/tranzzo-api/index.html#widget-checkout) then you can use `key` parameter value.
    Otherwise, you need to be signed up to Tranzzo Services and obtain you `appKey` from the Tranzzo dashboard.
    
    Choose your `environment` depending on your needs. If you need to test your workflow in a SandBox mode, you should use `.stage`
    
3. Construct a card data with your user's card information
    
    ```swift
    let card = CardRequestData(
        cardNumber: "4242424242424242",
        cardExpMonth: 12,
        cardExpYear: 22,
        cardCvv: "123"
    )
    ```
    
4. 
    In case you want to receive a single token for your card, use this method 

    ```swift
    tokenizer.tokenize(card: card) { (result: Result<TranzzoTokenSuccess, TranzzoError>) in
        switch result {
        case .success(let tokenData):
            // Process your token
        case .failure(let error):
            // Handle an error
        }
    }
    ```
    If you want to receive additional card data with your token, like expiration date and card mask, use the following:

    ```swift
    tokenizer.tokenizeEncrypt(card: card) { (result: Result<TranzzoTokenDataSuccess, TranzzoError>) in
        switch result {
        case .success(let encryptedData):
            // Process your encrypted token data
        case .failure(let error):
            // Handle an error
        }
    }
    ```
Read our [decryption guide](https://github.com/tranzzo/ios-card-tokenizer/blob/dev/DecryptionGuide.md) to learn more about `encryptedData`

### Validation

Use `TranzzoCardValidator` to validate your user's card input, such as number, cvv and expiration date.

```swift
let validator = TranzzoCardValidator()
let numberIsValid = validator.isValid(cardNumber: cardNumber)
```

Specify `CardProvider` to validate it's cvv.

```swift
let cvvIsValid = validator.isValid(cvv: "123", for: .visa)
```

Get the provider of a card by it's full number

```swift
let provider = validator.getCardType(for: "4222222222222222") // .visa
```

or by it's prefix (length depends on specific provider)

```swift
let provider = validator.getPartialCardType(for: "5455") // .mastercard
```
