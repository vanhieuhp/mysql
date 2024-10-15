const mysql = require('mysql2/promise');
const { faker } = require('@faker-js/faker');

// Function to generate and insert movie data
async function generateAndInsertMovieData(numRecords) {
    // Establish the MySQL connection
    const connection = await mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: 'admin',
        database: 'coursera',
    });

    // SQL query to insert data into the movies table
    const insertQuery = `
        INSERT INTO movies (title, director, release_year, genre, language,
                            duration_minutes, rating, box_office, production_company, description)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    const genres = ['Action', 'Comedy', 'Drama', 'Horror', 'Thriller', 'Sci-Fi', 'Romance'];
    const languages = ['English', 'Spanish', 'French', 'German', 'Japanese', 'Mandarin'];

    // Generate and insert movie data
    for (let i = 0; i < numRecords; i++) {
        const title = faker.lorem.words(4);
        const director = faker.person.fullName();
        const releaseYear = Math.floor(Math.random() * (2023 - 1950 + 1)) + 1950;
        const genre = genres[Math.floor(Math.random() * genres.length)];
        const language = languages[Math.floor(Math.random() * languages.length)];
        const durationMinutes = Math.floor(Math.random() * (180 - 80 + 1)) + 80;
        const rating = (Math.random() * (10 - 1) + 1).toFixed(1);
        const boxOffice = (Math.random() * (500000000 - 100000) + 100000).toFixed(2);
        const productionCompany = faker.company.name();
        const description = faker.lorem.sentences(2);

        // Execute the insert query
        await connection.execute(insertQuery, [
            title, director, releaseYear, genre, language, durationMinutes, rating, boxOffice, productionCompany, description
        ]);
    }

    // Close the connection
    await connection.end();
}

// Generate and insert 100 movie records
generateAndInsertMovieData(100)
    .then(() => console.log('Data generation completed'))
    .catch((error) => console.error('Error generating data:', error));