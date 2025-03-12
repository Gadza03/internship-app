/*
  Warnings:

  - You are about to drop the column `answers` on the `InterviewSlot` table. All the data in the column will be lost.

*/
-- CreateEnum
CREATE TYPE "QuestionType" AS ENUM ('Field', 'TextArea', 'Select', 'Slider', 'Checkbox', 'Date', 'DateTime', 'Radio', 'Number');

-- CreateEnum
CREATE TYPE "QuestionCategory" AS ENUM ('General', 'Personal', 'Development', 'Design', 'Marketing', 'Multimedia', 'Final');

-- AlterTable
ALTER TABLE "InterviewSlot" DROP COLUMN "answers";

-- CreateTable
CREATE TABLE "InterviewAnswer" (
    "id" TEXT NOT NULL,
    "interviewSlotId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "answer" TEXT NOT NULL,
    "flagged" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InterviewAnswer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InterviewQuestion" (
    "id" TEXT NOT NULL,
    "question" TEXT NOT NULL,
    "questionType" "QuestionType" NOT NULL,
    "questionCategory" "QuestionCategory" NOT NULL,
    "minValue" INTEGER,
    "maxValue" INTEGER,
    "stepValue" INTEGER DEFAULT 1,

    CONSTRAINT "InterviewQuestion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "QuestionOption" (
    "id" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "value" TEXT NOT NULL,

    CONSTRAINT "QuestionOption_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "InterviewAnswer" ADD CONSTRAINT "InterviewAnswer_interviewSlotId_fkey" FOREIGN KEY ("interviewSlotId") REFERENCES "InterviewSlot"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InterviewAnswer" ADD CONSTRAINT "InterviewAnswer_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "InterviewQuestion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QuestionOption" ADD CONSTRAINT "QuestionOption_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "InterviewQuestion"("id") ON DELETE CASCADE ON UPDATE CASCADE;
