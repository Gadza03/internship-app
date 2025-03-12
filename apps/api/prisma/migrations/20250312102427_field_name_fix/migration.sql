/*
  Warnings:

  - You are about to drop the column `questionCategory` on the `InterviewQuestion` table. All the data in the column will be lost.
  - You are about to drop the column `questionType` on the `InterviewQuestion` table. All the data in the column will be lost.
  - Added the required column `category` to the `InterviewQuestion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type` to the `InterviewQuestion` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "InterviewQuestion" DROP COLUMN "questionCategory",
DROP COLUMN "questionType",
ADD COLUMN     "category" "QuestionCategory" NOT NULL,
ADD COLUMN     "isEnabled" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "type" "QuestionType" NOT NULL;
