import requests
import json
import base64

# Define the GraphQL endpoint and your API key. Use the endpoint https://payments.braintree-api.com/graphql for production.
graphql_url = "https://payments.sandbox.braintree-api.com/graphql"
api_key_string = "PUBLIC_KEY:PRIVATE_KEY"

# Base64 encode API key
api_key_bytes = api_key_string.encode('utf-8')
api_key_base64_bytes = base64.b64encode(api_key_bytes)
api_key_base64_string = api_key_base64_bytes.decode('utf-8')

# Read PayPal billing agreement IDs from a file
def read_billing_agreement_ids(filename):
    with open(filename, 'r') as file:
        return [line.strip() for line in file]

# Create the vaultPayPalBillingAgreement mutation query
def create_vault_mutation_query(billing_agreement_id):
    return {
        "query": """
        mutation VaultPayPalBillingAgreement($input: VaultPayPalBillingAgreementInput!) {
            vaultPayPalBillingAgreement(input: $input) {
                clientMutationId
                paymentMethod {
                    id
                    legacyId
                }
            }
        }
        """,
        "variables": {
            "input": {
                "billingAgreementId": billing_agreement_id
            }
        }
    }

# Make the GraphQL API call
def vault_paypal_billing_agreement(billing_agreement_id):
    query = create_vault_mutation_query(billing_agreement_id)
    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Basic {api_key_base64_string}",
        "Braintree-Version": "2024-07-01"
    }
    response = requests.post(graphql_url, headers=headers, json=query)
    return response.json()

# Main function
def main():
    billing_agreement_ids = read_billing_agreement_ids("billing_agreement_ids.txt")
    
    for billing_agreement_id in billing_agreement_ids:
        result = vault_paypal_billing_agreement(billing_agreement_id)
        print(f"Vaulted billing agreement ID {billing_agreement_id}: {result}")

if __name__ == "__main__":
    main()
