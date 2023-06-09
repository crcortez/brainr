"""create likes

Revision ID: 3e6af235a6ce
Revises: 
Create Date: 2022-11-11 17:47:58.274864

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '3e6af235a6ce'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    op.execute(
        """
        CREATE TABLE likes(
            user_id SERIAL PRIMARY KEY,
            created_at TEXT NOT NULL,
            blogpost_id INT NOT NULL
        );
        """
    )


def downgrade():
    op.execute(
        """
        DROP TABLE likes;
        """
    )
