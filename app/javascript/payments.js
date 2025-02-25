$(document).on("turbo:load", function() {
    let contractInput = $("#payment_contract_id");
    let productInput = $("#payment_product_name");

    function fetchLastPayment() {
        let contractId = $("#payment_contract_id").val();
        let productName = $("#payment_product_name").val();
    
        if (contractId && productName) {
            $.ajax({
                url: "/payments/last_payment",
                method: "GET",
                data: {
                    contract_id: contractId,
                    product_name: productName
                },
                dataType: "json",
                success: function(data) {
                    console.log("Last payment data:", data);
    
                    $("#quantity").val(data.quantity || "");
                    $("#price").val(data.price || "");
                    
                    let amount = (data.quantity * data.price) || 0;
                    $("#amount").val(amount.toFixed(2));
    
                    $("#payment_paid").val(data.paid || "");
                    $("#payment_payment_date").val(data.payment_date || "");
                    $("#payment_status_id").val(data.status_id || "");
    
                    $("#bank_transaction input[data-type='amount']").val(data.last_bank_amount || "");
                    $("#bank_transaction input[data-type='exchange_rate']").val(data.last_bank_exchange_rate || "");
                    $("#bank_transaction input[data-type='vnd_value']").val(data.last_bank_amount * data.last_bank_exchange_rate || "");

                    $("#personal_transaction input[data-type='amount']").val(data.last_personal_amount || "");
                    $("#personal_transaction input[data-type='exchange_rate']").val(data.last_personal_exchange_rate || "");
                    $("#personal_transaction input[data-type='vnd_value']").val(data.last_personal_amount * data.last_personal_exchange_rate || "");


                },
                error: function(xhr, status, error) {
                    console.error("Error fetching last payment:", error);
                }
            });
        }
    }
    

    if (contractInput.length && productInput.length) {
        contractInput.on("change", fetchLastPayment);
        productInput.on("input", fetchLastPayment);
    }
});


