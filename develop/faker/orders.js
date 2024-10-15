const mysql = require('mysql2/promise');
const { faker } = require('@faker-js/faker');

async function generateAndInsertOrderData(numRecords) {
    // Establish the MySQL connection
    const connection = await mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: 'admin',
        database: 'coursera',
    });

    // SQL query to insert data into the orders table
    const insertQuery = `
        INSERT INTO orders (customer_id, order_date, total_amount, status, 
                            shipping_address, billing_address, payment_method)
        VALUES (?, ?, ?, ?, ?, ?, ?)
    `;

    const statuses = ['Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled'];
    const paymentMethods = ['Credit Card', 'PayPal', 'Bank Transfer', 'Cash on Delivery'];

    // Generate and insert order data
    for (let i = 0; i < numRecords; i++) {
        const customerId = faker.number.int({min: 1, max: 1000}); // Assuming customer IDs range from 1 to 1000
        const orderDate = faker.date.past(2); // Order date within the last 2 years
        const totalAmount = faker.number.float({ min: 1, max: 10000, precision: 0.1 }); // Order total between $10 and $1000
        const status = faker.helpers.arrayElement(statuses);
        const shippingAddress = faker.location.streetAddress() + ", " + faker.location.city() + ", " + faker.location.state() + " " + faker.location.zipCode();
        const billingAddress = Math.random() > 0.3 ? shippingAddress : faker.location.streetAddress() + ", " + faker.location.city() + ", " + faker.location.state() + " " + faker.location.zipCode(); // 70% chance billing address is the same as shipping
        const paymentMethod = faker.helpers.arrayElement(paymentMethods);

        // Execute the insert query
        await connection.execute(insertQuery, [
            customerId, orderDate, totalAmount, status, shippingAddress, billingAddress, paymentMethod
        ]);
    }

    // Close the connection
    await connection.end();
}

// Generate and insert 1000 order records
generateAndInsertOrderData(1000)
    .then(() => console.log('Order data generation completed'))
    .catch((error) => console.error('Error generating order data:', error));