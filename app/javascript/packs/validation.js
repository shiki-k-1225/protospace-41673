document.addEventListener("DOMContentLoaded", function() {
  const commentForm = document.querySelector('.comment-form');

  if (commentForm) {
    commentForm.addEventListener('submit', function(event) {
      const commentContent = document.querySelector('#comment_content');
      if (!commentContent.value.trim()) {
        event.preventDefault();
        alert('コメント内容を入力してください。');
      }
    });
  }
});
