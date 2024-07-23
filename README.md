# Braintree batch scripts

## Braintree Transaction Settlement Script

This Python script reads a list of Braintree transaction IDs from a text file and submits each transaction for settlement.

### Prerequisites

- Python 3.x installed on your machine.
- A Braintree account with API credentials.

### Installation

1. Clone the repository to your local machine:

    ```bash
    git clone https://github.com/orcunbt/braintree-scripts.git
    cd braintree-scripts
    ```

2. Install the required Python package:

    ```bash
    pip install braintree
    ```

### Configuration

1. Open the script file in your preferred text editor:

    ```bash
    nano submit_for_settlement.py
    ```

2. Replace the placeholders in the `braintree.Configuration.configure` method with your actual Braintree credentials:

    ```python
    braintree.Configuration.configure(
        braintree.Environment.Sandbox,  # or braintree.Environment.Production for live environment
        merchant_id='your_merchant_id',
        public_key='your_public_key',
        private_key='your_private_key'
    )
    ```

### Usage

1. Create a text file (e.g., `transaction_ids.txt`) containing the transaction IDs you want to submit for settlement, one per line.

2. Run the script:

    ```bash
    python submit_for_settlement.py
    ```

3. If your file is named something other than `transaction_ids.txt`, replace the file name in the script's `main` function call:

    ```python
    if __name__ == "__main__":
        # Replace 'transaction_ids.txt' with the path to your text file
        main('your_file_name.txt')
    ```

### Example

Here's an example of how the `transaction_ids.txt` file should look:

    ```
    transaction_id_1
    transaction_id_2
    transaction_id_3
    ```

When you run the script, it will read each transaction ID from the file and attempt to submit it for settlement. You will see output indicating whether each transaction was successfully submitted or if there was an error.

## Braintree Transaction Void Script

This Python script reads a list of Braintree transaction IDs from a text file and voids each transaction.

### Prerequisites

- Python 3.x installed on your machine.
- A Braintree account with API credentials.

### Installation

1. Clone the repository to your local machine:

    ```bash
    git clone https://github.com/orcunbt/braintree-scripts.git
    cd braintree-scripts
    ```

2. Install the required Python package:

    ```bash
    pip install braintree
    ```

### Configuration

1. Open the script file in your preferred text editor:

    ```bash
    nano transaction_void.py
    ```

2. Replace the placeholders in the `braintree.Configuration.configure` method with your actual Braintree credentials:

    ```python
    braintree.Configuration.configure(
        braintree.Environment.Sandbox,  # or braintree.Environment.Production for live environment
        merchant_id='your_merchant_id',
        public_key='your_public_key',
        private_key='your_private_key'
    )
    ```

### Usage

1. Create a text file (e.g., `transaction_ids.txt`) containing the transaction IDs you want to void, one per line.

2. Run the script:

    ```bash
    python transaction_void.py
    ```

3. If your file is named something other than `transaction_ids.txt`, replace the file name in the script's `main` function call:

    ```python
    if __name__ == "__main__":
        # Replace 'transaction_ids.txt' with the path to your text file
        main('your_file_name.txt')
    ```

### Example

Here's an example of how the `transaction_ids.txt` file should look:

    ```
    transaction_id_1
    transaction_id_2
    transaction_id_3
    ```

When you run the script, it will read each transaction ID from the file and attempt to void it. You will see output indicating whether each transaction was successfully voided or if there was an error.


## Braintree PayPal Billing Agreement Vaulting Script

This Python script reads PayPal billing agreement IDs from a text file and uses the Braintree GraphQL API to vault each billing agreement.

### Requirements

- Python 3.x
- `requests` library

### Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/orcunbt/braintree-scripts.git
   cd braintree-scripts

2. **Create a virtual environment**:

    ```bash
    python3 -m venv myenv
    source myenv/bin/activate

3. **Install dependencies**:

    ```bash
    pip install requests
    
4. **Prepare the text file**:
    Create a file named billing_agreement_ids.txt in the project directory. Each line in this file should contain a single PayPal billing agreement ID.

5. **Set your API key**:
    Replace "PUBLIC_KEY:PRIVATE_KEY" with your actual Braintree API key. See here for more details: https://developer.paypal.com/braintree/articles/control-panel/important-gateway-credentials

6. **Usage**:
    Run the script:

    ```bash
    python import_paypal_billing_agreements.rb

    Output:
    Vaulted billing agreement ID B-5YA36917G2603023J: {'data': {'vaultPayPalBillingAgreement': {'clientMutationId': None, 'paymentMethod': {'id': 'cGF5bWVudG1ldGhvZF9wcF9xeWE2eG4wcQ', 'legacyId': 'qya6xn0q'}}}, 'extensions': {'requestId': 'f08e9ba1-910a-4c00-bca3-feb38f4c3c2e'}}
    Vaulted billing agreement ID B-47B29508S46644328: {'data': {'vaultPayPalBillingAgreement': {'clientMutationId': None, 'paymentMethod': {'id': 'cGF5bWVudG1ldGhvZF9wcF9rNGpqZmhweA', 'legacyId': 'k4jjfhpx'}}}, 'extensions': {'requestId': 'fc4219e4-c2ae-4321-b37e-f3bb01815d3c'}}