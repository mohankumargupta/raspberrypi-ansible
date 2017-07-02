#include <iostream>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/text.hpp>


using namespace std;

void fiddleWithCamera() {
    cv::VideoCapture cap(1);

    cv::Mat frame;
    cv::Ptr<cv::text::OCRTesseract> ocr2 = cv::text::OCRTesseract::create();
    string output2;

    for (; ; ) {
        cap >> frame;
        cv::imshow("fromcamera", frame);
        if (cv::waitKey(10) != 0xff) {
            cout << "--------Start Output from OCR (video)----------" << endl;
            ocr2->run(frame, output2);
            cout << output2 << endl;
            cout << "--------End Output from OCR (video)----------" << endl;
            break;
        }

    }

    if (!cap.isOpened()) {
        cout << "can't open video." << endl;
    }
}

void fiddleWithImages() {
    cv::Mat mt = cv::imread("capture.jpg");
    cv::imshow("boo", mt);
    cv::waitKey(0);

    cv::Mat gs;
    cv::cvtColor(mt, gs, CV_BGR2GRAY);
    cv:imshow("moo", gs);
    cv::waitKey(0);


    cout << "--------Start Output from OCR (images)----------" << endl;
    cv::Ptr<cv::text::OCRTesseract> ocr = cv::text::OCRTesseract::create();
    string output;
    vector<cv::Rect>   boxes;
    vector<string> words;
    vector<float>  confidences;
    ocr->run(gs, output);
    cout << output << endl;
    cout << "--------End Output from OCR (images)----------" << endl;
}

int main() {
    fiddleWithImages();
    fiddleWithCamera();
}