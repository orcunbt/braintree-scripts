import braintree
import os

# Configure Braintree credentials
braintree.Configuration.configure(
    braintree.Environment.Sandbox,  # or braintree.Environment.Production for live environment
    merchant_id='your_merchant_id',
    public_key='your_public_key',
    private_key='your_private_key'
)

def submit_transaction_for_settlement(transaction_id):
    result = braintree.Transaction.submit_for_settlement(transaction_id)
    if result.is_success:
        print(f"Transaction {transaction_id} successfully submitted for settlement.")
    else:
        print(f"Failed to submit transaction for settlement {transaction_id}: {result.message}")

def main(file_path):
    if not os.path.isfile(file_path):
        print(f"File not found: {file_path}")
        return

    with open(file_path, 'r') as file:
        transaction_ids = file.readlines()

    # Remove any leading/trailing whitespace characters from each line
    transaction_ids = [tid.strip() for tid in transaction_ids]

    for transaction_id in transaction_ids:
        submit_transaction_for_settlement(transaction_id)

if __name__ == "__main__":
    # Replace 'transaction_ids.txt' with the path to your text file
    main('transaction_ids.txt')
