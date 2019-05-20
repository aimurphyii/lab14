-- create a new table in the cookshelves database
Query 1: CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

-- get bookshelf names from books table and insert the unique names in to bookshelves table
Query 2: INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

-- giving a bookshelf_id category to the books table, this will serve as our foreign key later
Query 3: ALTER TABLE books ADD COLUMN bookshelf_id INT;

-- here we are aligning the books table to our bookshelves table by linking the bookshelf name (bookshelf_id) in books to a shelf name in bookshelves
Query 4: UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

-- now that our foreign key bookshelf_id is linking to the shelf in bookshelves we can get rid of the bookshelf category, since the shelves are now a separate table of their own
Query 5: ALTER TABLE books DROP COLUMN bookshelf;

-- we need to do this to make the link that this value is referencing the new table
Query 6: ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);

