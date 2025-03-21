public class iPhone implements ReprodutorMusical, AparelhoTelefonico, NavegadorInternet {

    @Override
    public void play() {
        System.out.println("Playing music...");
    }

    @Override
    public void pause() {
        System.out.println("Pausing music...");
    }

    @Override
    public void stop() {
        System.out.println("Stopping music...");
    }

    @Override
    public void nextTrack() {
        System.out.println("Next track...");
    }

    @Override
    public void previousTrack() {
        System.out.println("Previous track...");
    }

    @Override
    public void makeCall(String number) {
        System.out.println("Calling " + number + "...");
    }

    @Override
    public void endCall() {
        System.out.println("Ending call...");
    }

    @Override
    public void answerCall() {
        System.out.println("Answering call...");
    }

    @Override
    public void openPage(String url) {
        System.out.println("Opening page: " + url);
    }

    @Override
    public void refreshPage() {
        System.out.println("Refreshing page...");
    }

    @Override
    public void bookmarkPage(String url) {
        System.out.println("Bookmarking page: " + url);
    }
}
